// Переменная для хранения полного списка законов
let allLaws = [];

// Функция отрисовки карточек на странице
function renderLaws(laws) {
    const container = document.getElementById('laws-list');
    container.innerHTML = '';

    // Если ничего не найдено
    if (laws.length === 0) {
        container.innerHTML = '<p class="empty-message">Законы не найдены</p>';
        return;
    }

    // Перебираем законы и создаем карточки
    laws.forEach(law => {
        const card = document.createElement('div');
        card.className = 'law-card';

        // Определяем статус: действует или утратил силу
        const statusClass = law.in_force ? 'status-active' : 'status-inactive';
        const statusText = law.in_force ? 'Действует' : 'Утратил силу';

        // Заполняем карточку: название, номер, год и статус
        card.innerHTML = `
            <h3>${law.title}</h3>
            <p><strong>Номер:</strong> ${law.number}</p>
            <p><strong>Год:</strong> ${law.year}</p>
            <span class="status-badge ${statusClass}">${statusText}</span>
        `;

        container.appendChild(card);
    });
}

// Загружаем данные из файла data.json
fetch('data.json')
    .then(response => response.json())
    .then(data => {
        allLaws = data;
        renderLaws(allLaws);
    })
    .catch(error => {
        console.error('Ошибка при загрузке data.json:', error);
    });

// Поиск: фильтруем список при вводе текста (без учета регистра)
const searchInput = document.getElementById('search-input');
searchInput.addEventListener('input', (e) => {
    const query = e.target.value.toLowerCase().trim();
    const filtered = allLaws.filter(law =>
        law.title.toLowerCase().includes(query)
    );
    renderLaws(filtered);
});

// Загружаем данные из файла data.json
fetch('data.json')
    .then(response => response.json())
    .then(data => {
        // Находим блок для карточек
        const container = document.getElementById('laws-list');

        // Перебираем каждый закон и создаем для него карточку
        data.forEach(law => {
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

            // Добавляем карточку на страницу
            container.appendChild(card);
        });
    })
    .catch(error => {
        console.error('Ошибка при загрузке data.json:', error);
    });

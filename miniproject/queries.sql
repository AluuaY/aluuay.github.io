-- какие услуги бесплатные (WHERE)
SELECT name FROM services WHERE  cost_mrp = 0;
-- услуги от самых долгих к быстрым
SELECT name, days FROM services ORDER BY days DESC;
-- средний срок оказания услуги в рабочих днях ( AVRG)
SELECT AVG(days) FROM services;
-- сколько услуг у каждого ведомства 
SELECT agency_id,  COUNT (*)  FROM services GROUP BY agency_id;
-- Услуга, её срок и ведомство, которое её оказывает (JOIN)
SELECT  services.name, services.days, agencies.name  FROM services JOIN agencies ON services.agency_id = agencies.id;


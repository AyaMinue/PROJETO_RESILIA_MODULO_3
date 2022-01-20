--Perguntas do Cliente
--(R) Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;
SELECT students.name ESTUDANTE, course.name CURSO FROM tb_students students
JOIN tb_class class ON students.id_class = class.id_class
JOIN tb_course course ON class.id_course = course.id_course;

--(R) Selecionar a quantidade total de estudantes cadastrados no banco;
SELECT count(id_students) TOTAL FROM tb_students;

--(R) Selecionar quais pessoas facilitadoras atuam em mais de uma turma. (ORDENAR POR ORDEM ALFABÉTICA);

SELECT historico.id_facilitator_tech as id_facilitators, facilitators.name, facilitators.type, COUNT(DISTINCT students.id_class) as Total_turmas FROM tb_students students
JOIN tb_students_module_facilitators historico ON historico.id_students = students.id_students
JOIN tb_facilitators facilitators ON facilitators.id_facilitators = historico.id_facilitator_tech
GROUP BY historico.id_facilitator_tech, facilitators.name, facilitators.type
UNION
SELECT historico.id_facilitator_soft as id_facilitators, facilitators.name, facilitators.type, COUNT(DISTINCT students.id_class) as Total_turmas FROM tb_students students
JOIN tb_students_module_facilitators historico ON historico.id_students = students.id_students
JOIN tb_facilitators facilitators ON facilitators.id_facilitators = historico.id_facilitator_soft
GROUP BY historico.id_facilitator_soft, facilitators.name, facilitators.type ORDER BY name;

--Perguntas da equipe
--(G) Quantos alunos já finalizaram cada curso;
SELECT course.name CURSO, count(students.graduated) FORMADOS FROM tb_students students
JOIN tb_class class ON students.id_class = class.id_class
JOIN tb_course course ON class.id_course = course.id_course
WHERE students.graduated = True
GROUP BY course.name
ORDER BY count(students.graduated) DESC;

--(G) Quantidade total de alunos por curso;
select course.name, count(students.id_class) as total from tb_students students
JOIN tb_class class ON students.id_class = class.id_class
JOIN tb_course course ON class.id_course = course.id_course
GROUP BY course.name;

--(G)Média de Idade por Curso
select course.name, ROUND(AVG(2021 - EXTRACT (YEAR FROM students.birthday)),2) MEDIA_idade from tb_students students 
JOIN tb_class class ON students.id_class = class.id_class
JOIN tb_course course ON class.id_course = course.id_course
GROUP BY course.name;

--(G) Quantidade total de alunos que já foram contratados na área;
SELECT count(students.employed_on_field) as total FROM tb_students students
WHERE students.employed_on_field = TRUE;

--(G) Quantidade de alunos que já foram contratados na área por turma
SELECT class.name, count(students.employed_on_field) as total from tb_students students
JOIN tb_class class on class.id_class = students.id_class
WHERE students.employed_on_field = TRUE
GROUP BY class.name ORDER BY count(students.employed_on_field) DESC;
SELECT nombre FROM producto; -- 1.
SELECT nombre, precio FROM producto; -- 2.
SELECT * FROM producto; -- 3.
SELECT nombre,precio, precio * 1.04 AS dolares FROM producto; -- 4.
SELECT nombre AS "nom de producto", precio AS "euros", precio * 1.04 AS "dolares norte-americanos" FROM producto; -- 5.
SELECT UPPER (nombre), precio FROM producto; -- 6.
SELECT LOWER (nombre), precio FROM producto; -- 7.
SELECT * FROM fabricante;
SELECT nombre, UPPER (SUBSTRING(nombre, 1,2))AS "nombre en mayusculas" FROM fabricante; -- 8.
SELECT * FROM producto;
SELECT nombre, ROUND (precio, 0) FROM producto; -- 9.
SELECT * FROM producto;
SELECT nombre, TRUNCATE (precio, 0) FROM producto; -- 10.
SELECT codigo_fabricante FROM producto; -- 11.
SELECT DISTINCT codigo_fabricante FROM producto; -- 12
SELECT * FROM fabricante;
SELECT nombre FROM fabricante ORDER BY nombre; -- 13
SELECT nombre FROM fabricante ORDER BY nombre DESC; -- 14
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC; -- 15?
SELECT * FROM fabricante WHERE codigo<6; -- 16
SELECT * FROM fabricante WHERE codigo>=4 AND codigo<6; -- 17
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1 ; -- 18
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1; -- 19
SELECT nombre, codigo FROM producto WHERE codigo = 2; -- 20
SELECT  pr. nombre, pr. precio, fa. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo; -- 21
SELECT  pr. nombre, pr. precio, fa. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo ORDER BY fa.nombre; -- 22
SELECT pr.codigo, pr.nombre, fa.codigo, fa. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo; -- 23
SELECT pr. nombre,pr. precio, fa. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo ORDER BY pr.precio LIMIT 1; -- 24
SELECT pr. nombre,pr. precio, fa. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo ORDER BY pr.precio DESC LIMIT 1; -- 25
SELECT pr. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo WHERE fa. nombre = 'Lenovo';-- 26
SELECT pr. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo WHERE fa. nombre = 'Crucial' AND pr. precio > 200; -- 27
SELECT pr. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo WHERE fa. nombre = 'Asus' OR fa. nombre = 'Hewlett-Packard' OR fa. nombre = 'Seagate'; -- 28
SELECT pr. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo WHERE fa.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');-- 29
SELECT pr. nombre, pr. precio FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo WHERE fa. nombre LIKE '%e'; -- 30
SELECT pr. nombre, pr. precio FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo WHERE fa. nombre LIKE '%w%'; -- 31
SELECT pr. nombre, pr. precio, fa. nombre FROM producto pr JOIN fabricante fa ON pr.codigo_fabricante = fa.codigo WHERE pr. precio >= 180 ORDER BY pr.precio DESC , pr.nombre ASC; -- 32
SELECT nombre, codigo FROM fabricante WHERE EXISTS (SELECT nombre FROM producto WHERE producto.codigo_fabricante = fabricante.codigo); -- 33
SELECT fa.nombre, pr. nombre FROM fabricante fa LEFT JOIN producto pr ON pr.codigo_fabricante = fa.codigo; -- 34
SELECT fa.nombre, pr. nombre FROM fabricante fa LEFT JOIN producto pr ON pr.codigo_fabricante = fa.codigo WHERE pr.nombre IS NULL; -- 35
SELECT fa.nombre, pr. nombre FROM fabricante fa LEFT JOIN producto pr ON pr.codigo_fabricante = fa.codigo WHERE fa.nombre = 'Lenovo'; -- 36
SELECT nombre, precio, codigo_fabricante, codigo FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')); -- 37
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre= 'Lenovo')); -- 38
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante= (SELECT codigo FROM fabricante WHERE nombre= 'Hewlett-Packard')); -- 39
SELECT nombre, precio, codigo, codigo_fabricante FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante= (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo')); -- 40
SELECT nombre, precio, codigo, codigo_fabricante FROM producto WHERE precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre= 'Asus')); -- 41

--UNIVERSIDAD--
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo='alumno' ORDER BY nombre, apellido1, apellido2 ASC; -- 1
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo ='alumno' AND telefono IS NULL; -- 2
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR (fecha_nacimiento) = 1999; -- 3
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K'; -- 4
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7; -- 5
SELECT pe.nombre,pe.apellido1, pe.apellido2, de.nombre AS departamento FROM persona pe JOIN profesor pr ON pe.id = pr.id_profesor JOIN departamento de ON pr. id_departamento = de.id ORDER BY pe.nombre, pe.apellido1, pe.apellido2 ASC; -- 6
SELECT pe.nif, a.nombre, cu.anyo_inicio, cu.anyo_fin FROM alumno_se_matricula_asignatura al JOIN persona pe ON pe.id=al.id_alumno JOIN asignatura a ON al.id_asignatura= a.id JOIN curso_escolar cu ON al.id_curso_escolar= cu.id WHERE pe.nif = '26902806M'; -- 7
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'; -- 8
SELECT DISTINCT pe.* FROM persona pe JOIN alumno_se_matricula_asignatura al ON pe.id=al.id_alumno JOIN asignatura a ON a.id=al.id_asignatura JOIN curso_escolar cu ON al.id_curso_escolar=cu.id WHERE YEAR(anyo_inicio)=2018 OR YEAR(anyo_inicio)=2019; -- 9

-- left y right join
SELECT de.nombre AS nombre_departamento,pe.apellido1, pe.apellido2, pe.nombre FROM persona pe JOIN profesor pr ON pe.id=pr.id_profesor LEFT JOIN departamento de ON pr.id_departamento=de.id ORDER BY de.nombre, pe.apellido1, pe.apellido2, pe.nombre ASC; -- 1
SELECT pe.nombre, pe.apellido1, pe.apellido2, de.nombre AS nombre_departamento FROM profesor pr JOIN persona pe ON pr.id_profesor = pe.id LEFT JOIN departamento de ON pr.id_departamento = de.id WHERE pr.id_departamento IS NULL; -- 2
SELECT de.nombre AS nombre_departamento FROM profesor pr JOIN persona pe ON pr.id_profesor = pe.id RIGHT JOIN departamento de ON pr.id_departamento = de.id WHERE pe.nombre IS NULL; -- 3
SELECT DISTINCT pe.* FROM persona pe JOIN profesor pr ON pe.id=pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor=pr.id_profesor WHERE a.nombre IS NULL; -- 4
SELECT a.nombre , pe.nombre FROM persona pe JOIN profesor pr ON pe.id=pr.id_profesor RIGHT JOIN asignatura a ON a.id_profesor=pr.id_profesor WHERE a.id_profesor IS NULL; -- 5
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento= d.id LEFT JOIN asignatura a ON a.id_profesor= pr.id_profesor WHERE a.id_profesor IS NULL; -- 6

-- consultas resumen
SELECT COUNT(tipo) FROM persona WHERE tipo ='alumno'; -- 1
SELECT COUNT(tipo) FROM persona WHERE tipo='alumno' AND YEAR (fecha_nacimiento)=1999; -- 2
SELECT d.nombre, COUNT(pr.id_profesor) AS numero_profesores FROM departamento d JOIN profesor pr ON d.id=pr.id_departamento GROUP BY d.nombre ORDER BY numero_profesores DESC; -- 3
SELECT d.nombre, COUNT(pr.id_profesor) AS numero_profesores FROM departamento d LEFT JOIN profesor pr ON d.id=pr.id_departamento GROUP BY d.nombre; -- 4
SELECT gr.nombre, COUNT(a.nombre) AS numero_asignaturas FROM grado gr LEFT JOIN asignatura a ON gr.id=a.id_grado GROUP BY gr.nombre ORDER BY numero_asignaturas DESC;-- 5
SELECT gr.nombre, COUNT(a.nombre) AS numero_asignaturas FROM grado gr LEFT JOIN asignatura a ON gr.id=a.id_grado GROUP BY gr.nombre HAVING COUNT(a.nombre)>40; -- 6
SELECT gr.nombre AS nombre_grado, SUM(a.creditos) AS numero_creditos, a.tipo AS tipo_asignatura FROM grado gr JOIN asignatura a ON gr.id=a.id_grado GROUP BY a.tipo, gr.nombre; -- 7
SELECT cu.anyo_inicio, COUNT(DISTINCT al.id_alumno) AS alumnos_matriculados FROM curso_escolar cu JOIN alumno_se_matricula_asignatura al ON cu.id=al.id_curso_escolar GROUP BY cu.anyo_inicio; -- 8
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.nombre) AS asignaturas_impartidas FROM persona pe LEFT JOIN asignatura a ON pe.id=a.id_profesor WHERE pe.tipo= 'profesor' GROUP BY pe.id, pe.nombre,pe.apellido1,pe.apellido2 ORDER BY asignaturas_impartidas DESC ; -- 9
SELECT * FROM persona WHERE tipo= 'alumno' AND fecha_nacimiento =( SELECT MAX(fecha_nacimiento) FROM persona); -- 10
SELECT pe.id, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.nombre) AS asignaturas_impartidas FROM persona pe LEFT JOIN asignatura a ON pe.id=a.id_profesor WHERE pe.tipo= 'profesor' GROUP BY pe.id, pe.nombre,pe.apellido1,pe.apellido2; -- 10
SELECT pr.id_profesor,pe.nombre AS nombre_profesor , pe.apellido1,pe.apellido2,de.nombre AS nombre_departamento FROM profesor pr JOIN departamento de ON pr.id_departamento = de.id JOIN persona pe ON pr.id_profesor = pe.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id IS NULL;-- 11
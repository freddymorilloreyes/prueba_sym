# prueba_sym
Prueba para optime consulting

para instalar el proyecto 

1. git clone https://github.com/freddymorilloreyes/prueba_sym.git

2. cd prueba_sym

3. composer install

4. configura el archivo .env

5. generar la base de datos ejecutando php bin/console doctrine:database:create

6. ejecuta las migraciones con php bin/console doctrine:migrations:migrate

7. carga los fixtures con php bin/console doctrine:fixtures:load

(si deseas te puedes saltar el paso 6 y 7 importando las tablas a la base de datos creada en el paso 5, el archivo astá en la raíz del proyecto prueba_sym.sql)

8. inicia el servidor con symfony server:start

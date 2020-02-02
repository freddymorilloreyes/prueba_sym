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

8. inicia el servidor con symfony server:start

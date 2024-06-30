########Manual
#USE mysql;
#SET @password = 'password';
#UPDATE user SET password=PASSWORD(@password) WHERE user='root';
#GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY @password;

## Create db struct and mt2 user with limited privileges
mysql -uroot -ppassword < base/mt2_user_d.sql

## Create clean metin2 db struct
mysql -uroot -ppassword account < structs/account.sql
mysql -uroot -ppassword common < structs/common.sql
mysql -uroot -ppassword log < structs/log.sql
mysql -uroot -ppassword player < structs/player.sql

# Create clean metin2 db records
mysql -uroot -ppassword account < records/account.sql
mysql -uroot -ppassword common < records/common.sql
#mysql -uroot -ppassword log < records/log.sql
mysql -uroot -ppassword player < records/player.sql

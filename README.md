Управление сетевыми настройками системы

Авторы: Пуртов Михаил, Мильват Кирилл

С помощью скрипта можно изменять основные настройки сетевых интерфейсов, выводить RX, TX, карту сети, убивать процессы по занимаемому порту

Ключи:
-h, --help - справка [net -h | --help].

-i, --info - информация о сетевых интерфейсах [net -i | --info]

-u, --up - включение интерфейса [net -u | --up interface_name_i]

-d, --down - отключение интерфейса [net -d | --down interface_name_i]

-c, --config - установка IP/MASK [net -c | --config cur_ip new_ip new_mask]

-g, --gateway - установка Gateway [net -g | --gateway destination gateway]

-k, --kill - убийство процесса по занимаемому порту [net -k | --kill port]

Примеры запуска:
"./main.sh -d lo"
"./main.sh -i"

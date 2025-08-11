# Содержание
- [Работа с этим репозиторием](#работа-с-репозиторием) 
- [Установка Zig](#установка-Zig)
- [Куда Zig мусорит?](#кэш-Zig)

--- 
## Работа с репозиторием

Клонирование через 

```
git clone --recurse-submodules https://github.com/laserattack/zig-knowledge-base
```

## Установка Zig

*Релизы Zig — это автономные архивы, которые можно разместить в любом месте системы и сразу пользоваться Zig*

Скачал архив под свою систему тут [ziglang.org/ru-RU/download/](https://ziglang.org/ru-RU/download/), распаковал в папку на рабочем столе

```
serr@home:~/Рабочий стол/zig$ ls
doc  lib  LICENSE  README.md  zig
```

Проверка работоспособности

```
serr@home:~/Рабочий стол/zig$ ./zig env
.{
    .zig_exe = "/home/serr/\xd0\xa0\xd0\xb0\xd0\xb1\xd0\xbe\xd1\x87\xd0\xb8\xd0\xb9 \xd1\x81\xd1\x82\xd0\xbe\xd0\xbb/zig/zig",
    .lib_dir = "lib",
    .std_dir = "lib/std",
    .global_cache_dir = "/home/serr/.cache/zig",
    .version = "0.15.0-dev.1380+e98aeeb73",
    .target = "x86_64-linux.6.8...6.8-gnu.2.39",
    .env = .{
        .ZIG_GLOBAL_CACHE_DIR = null,
        .ZIG_LOCAL_CACHE_DIR = null,
        .ZIG_LIB_DIR = null,
        .ZIG_LIBC = null,
        .ZIG_BUILD_RUNNER = null,
        .ZIG_VERBOSE_LINK = null,
        .ZIG_VERBOSE_CC = null,
        .ZIG_BTRFS_WORKAROUND = null,
        .ZIG_DEBUG_CMD = null,
        .CC = null,
        .NO_COLOR = null,
        .CLICOLOR_FORCE = null,
        .XDG_CACHE_HOME = null,
        .HOME = "/home/serr",
    },
}
```

Скопировал всю папку в `/usr/local/bin`

```
serr@home:~/Рабочий стол$ sudo cp -r zig/ /usr/local/bin/
[sudo] пароль для serr:         
serr@home:~$ ls /usr/local/bin
apt         highlight-mint  luajit-2.1.1753364724  luarocks-admin  sp.lua  zig
gnome-help  luajit          luarocks               search          yelp
```

и создал алиас в `~/.bashrc`

```
alias zig="/usr/local/bin/zig/zig"
```

Теперь zig можно запускать из любого места

```
serr@home:~/projects/zig-knowledge-base$ zig env
.{
    .zig_exe = "/usr/local/bin/zig/zig",
    .lib_dir = "/usr/local/bin/zig/lib",
    .std_dir = "/usr/local/bin/zig/lib/std",
    .global_cache_dir = "/home/serr/.cache/zig",
    .version = "0.15.0-dev.1380+e98aeeb73",
    .target = "x86_64-linux.6.8...6.8-gnu.2.39",
    .env = .{
        .ZIG_GLOBAL_CACHE_DIR = null,
        .ZIG_LOCAL_CACHE_DIR = null,
        .ZIG_LIB_DIR = null,
        .ZIG_LIBC = null,
        .ZIG_BUILD_RUNNER = null,
        .ZIG_VERBOSE_LINK = null,
        .ZIG_VERBOSE_CC = null,
        .ZIG_BTRFS_WORKAROUND = null,
        .ZIG_DEBUG_CMD = null,
        .CC = null,
        .NO_COLOR = null,
        .CLICOLOR_FORCE = null,
        .XDG_CACHE_HOME = null,
        .HOME = "/home/serr",
    },
}
```

## Language Server

В VSCode есть официальное расширение `Zig Language` от [ziglang.org](https://ziglang.org), в его настройках убрал абсолютно все галочки, а в `Zig: Path` вписал путь к исполняемому файлу компилятора (у меня `/usr/local/bin/zig/zig`)

## Кэш Zig

```
serr@home:~$ ls /home/serr/.cache/zig
b  h  o  tmp  z
```

*Куда Zig мусорит?*

| Папка     | Описание                                                                              |
| --------- | ------------------------------------------------------------------------------------- |
| **`b`**   | **Build artifacts** — промежуточные файлы сборки (объектные файлы, временные данные). |
| **`h`**   | **HTTP cache** — кеш загруженных зависимостей (например, пакетов из `zig fetch`).     |
| **`o`**   | **Object cache** — кеш скомпилированных объектов (ускоряет повторную сборку).         |
| **`tmp`** | **Временные файлы** — используется для операций вроде распаковки архивов.             |
| **`z`**   | **Глобальный кеш пакетов** (актуально для Zig 0.11+, где появилась система пакетов).  |
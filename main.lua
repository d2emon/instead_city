-- $Name: Город Новер$
-- $Version: 1.0$
-- $Author: d2emon$

instead_version "1.9.1"

-- Патч для старых версий
if stead.version < "1.5.3" then
	walk     = _G["goto"];
	walkin   = goin;
	walkout  = goout;
	walkback = goback;
end;

-- Модули
require "xact";     -- для создания ссылок
require "hideinv";  -- скрывает инвентарь тогда, когда мы захотим

require "para";     -- делает красные строки у параграфов
require "dash";     -- заменяет в тексте два минуса на типографское тире
require "quotes";   -- заменяет обычные кавычки на елочки

require "dbg";      -- добавляет отладку


-- Кодировка
game.codepage="UTF-8";

game.act = 'Не получается.';
game.use = 'Не сработает...';
game.inv = 'Гм.. Зачем это мне?..';

-- Базовая Комната
main = room {
    forcedsc = true,
    nam      = "Начало пути",
    dsc      = [[
Ваше путешествие начинается.
    ]],
    way      = {
        vroom('В Найт-сити', 'night'),
    },
};

gameover = room {
    forcedsc = true,
    noinv    = true,
    nam      = "Конец игры",
    dsc      = [[
У тебя не осталось сил. Ты теряешь сознание и погружаешься во тьму.
На этом твоё приключение окончено...
    ]],
};

pl = player {
    nam   = "Герой",
    where = 'main',
    var   = {
        gold = 15,
    },
    obj   = {
        'status',
    },
};

-- Статус игрока
status = stat { 
    nam = 'статус',
    disp = function(s)
        pn ('Деньги: ', pl.gold);
    end,
};

pl.gold = 15;

dofile "map.lua";

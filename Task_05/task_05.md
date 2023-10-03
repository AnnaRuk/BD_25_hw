
Напишите след/запросы:
Вывести ко-во незаблокированных юзеров не из Germany

db.users.find(
{is_blocked:{$ne:true}, country:{$ne:'Germany'}},
{_id:0}
).count()

Вывести имена юзеров не из Germany
db.users.find(
{country:{$ne:'Germany'}},
{fullname:1,_id:0}
)
Уменьшить баланс заблокированных юзеров на 5%
db.users.updateMany(
{ is_blocked: true },
{ $mul: { balance: 0.95 } }
)

Вывести название треков продолжительностью от 1 до 10 мин

db.tracks.find(
{duration_secs:{$gt:1*60, $lte:10*60}},
{title:1, _id:0}
)

Разблокировать юзеров из France
db.users.updateMany(
{country: 'France'},
{$unset:{is_blocked:null}}
)


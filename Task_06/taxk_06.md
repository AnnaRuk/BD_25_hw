### Напишите след/запросы:
### Разблокировать юзеров из France и Germany с положительным балансом

````tsx
db.users.updateMany(
{country:{$in: ['France','Germany']}, balance: {$gte:0} },
{$unset:{is_blocked:null}}
)
````
### Вывести названия двух произвольных треков

```tsx
db.tracks.aggregate([
{$sample:{size:1}},
{$project:{title: 1, _id: 0 }}
])
```
### Вывести юзеров, у которых есть треки

```tsx
db.users.aggregate([
{$lookup: {from: 'tracks', localField: '_id', foreignField: 'author_id', as: 'users_with_tracks' }},
{$match: { users_with_tracks: {$ne: []} }}
])
```
### Используя метод aggregate(), вывести ко-во юзеров без треков

```tsx
db.users.aggregate([
{$lookup: {from: 'tracks', localField: '_id', foreignField: 'author_id', as: 'users_with_tracks' }},
{$match: { users_with_tracks:  [] }},
{$count: 'users_with_tracks' }
])
```
---
name: SQLite Flashcards
---

---

How do you request all users from the `users` table via the CLI?

. . .

```sh
sqlite3 path/to/database.sqlite3 'SELECT * FROM users;'
```

---

How do you request all users named `John` from the `users` table?

. . .

```sql
SELECT *
FROM users
WHERE name == 'John';
```

Note: You must use single quotes for strings

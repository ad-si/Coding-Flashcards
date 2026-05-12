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

---

Open the SQLite interactive shell against a database file.

. . .

```sh
sqlite3 path/to/database.sqlite3
```

---

Open the SQLite interactive shell on a purely in-memory database.

. . .

```sh
sqlite3 ':memory:'
```

or simply `sqlite3` (without any argument).

---

Inside the SQLite shell, how do you exit the shell?

. . .

`.quit` (or `.exit`)

---

Inside the SQLite shell, list all tables in the current database.

. . .

`.tables`

---

Inside the SQLite shell, show the `CREATE` statement for table `users`.

. . .

`.schema users`

---

Inside the SQLite shell, show the `CREATE` statements for all tables.

. . .

`.schema`

---

Inside the SQLite shell, list all available dot commands.

. . .

`.help`

---

Inside the SQLite shell, switch the output to a nicely formatted table.

. . .

`.mode table`

or

`.mode box`

---

Inside the SQLite shell, turn column headers on for query output.

. . .

`.headers on`

---

Inside the SQLite shell, execute the SQL in `script.sql`.

. . .

`.read script.sql`

---

Inside the SQLite shell, time every query and print how long it took.

. . .

`.timer on`

---

Inside the SQLite shell, dump the entire database as SQL to stdout.

. . .

`.dump`

---

Inside the SQLite shell, dump only the `users` table as SQL.

. . .

`.dump users`

---

Inside the SQLite shell, save the dump to a file `backup.sql`.

. . .

```
.output backup.sql
.dump
.output stdout
```

---

Inside the SQLite shell, make a binary backup of the current database
to the file `backup.db`.

. . .

`.backup backup.db`

---

What are SQLite's five storage classes (the actual on-disk types)?

. . .

- `NULL`
- `INTEGER`
- `REAL`
- `TEXT`
- `BLOB`

---

What is "type affinity" in SQLite?

. . .

SQLite columns don't enforce a strict type.
Instead, each column has an *affinity* (a preferred storage class)
and SQLite tries to convert inserted values toward that affinity,
but it will still happily store a value of a different class.

(SQLite is dynamically typed at the value level, unlike most other SQL
databases which are statically typed at the column level.)

---

List SQLite's five column type affinities.

. . .

- `TEXT`
- `NUMERIC`
- `INTEGER`
- `REAL`
- `BLOB`

---

Since version 3.37, how can you make SQLite enforce column types strictly
like other SQL engines?

. . .

Append the `STRICT` keyword to the table definition:

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
) STRICT;
```

---

Create a `users` table with an integer primary key `id` and a non-null
text `name`.

. . .

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);
```

---

What is special about a column declared `INTEGER PRIMARY KEY` in SQLite?

. . .

It becomes an alias for the table's built-in `ROWID`.
It is automatically indexed, the values are unique, and inserting `NULL`
auto-generates the next available integer.

---

What is the difference between `INTEGER PRIMARY KEY` and
`INTEGER PRIMARY KEY AUTOINCREMENT`?

. . .

Without `AUTOINCREMENT`, SQLite may reuse `ROWID`s of deleted rows.
With `AUTOINCREMENT`, SQLite guarantees the generated id is strictly greater
than any id ever used in the table (using the `sqlite_sequence` table).

`AUTOINCREMENT` is slightly slower and is almost always unnecessary.

---

Insert a new user named `Alice` aged `30` into the `users` table.

. . .

```sql
INSERT INTO users (name, age)
VALUES ('Alice', 30);
```

---

Insert multiple users in a single statement.

. . .

```sql
INSERT INTO users (name, age) VALUES
  ('Alice', 30),
  ('Bob', 25),
  ('Carol', 42);
```

---

Update the user with id `1` to have name `'Alice'`.

. . .

```sql
UPDATE users
SET name = 'Alice'
WHERE id = 1;
```

---

Delete all users older than 99 from the `users` table.

. . .

```sql
DELETE FROM users
WHERE age > 99;
```

---

What does `DELETE FROM users;` (without a `WHERE`) do?

. . .

It deletes every row of the `users` table (but keeps the table).

---

Drop the `users` table entirely.

. . .

```sql
DROP TABLE users;
```

---

Drop the `users` table only if it exists, without raising an error
otherwise.

. . .

```sql
DROP TABLE IF EXISTS users;
```

---

Rename the table `users` to `accounts`.

. . .

```sql
ALTER TABLE users
RENAME TO accounts;
```

---

Add a column `email TEXT` to the `users` table.

. . .

```sql
ALTER TABLE users
ADD COLUMN email TEXT;
```

---

Rename column `name` in `users` to `full_name`.

. . .

```sql
ALTER TABLE users
RENAME COLUMN name TO full_name;
```

---

Drop the column `email` from `users`.

. . .

```sql
ALTER TABLE users
DROP COLUMN email;
```

(Requires SQLite 3.35+.)

---

Which is the SQL "not equal" operator?

. . .

`!=` and `<>` both work; the standard form is `<>`,
but SQLite accepts both interchangeably.

---

What is the difference between `=` and `==` in SQLite?

. . .

They are equivalent. `==` is a SQLite extension; the SQL standard form is `=`.
Either can be used in `WHERE` clauses.

---

How do you test whether `x` is `NULL`?

. . .

`x IS NULL`

(Never use `x = NULL` — that always evaluates to `NULL`, never `TRUE`.)

---

How do you test whether `x` is not `NULL`?

. . .

`x IS NOT NULL`

---

Find all users whose name contains the substring "an" (case insensitive
for ASCII).

. . .

```sql
SELECT *
FROM users
WHERE name LIKE '%an%';
```

`LIKE` is case-insensitive for ASCII by default in SQLite.

---

What are the wildcards used in `LIKE` patterns?

. . .

- `%` — matches zero or more characters
- `_` — matches exactly one character

---

What is the difference between `LIKE` and `GLOB`?

. . .

`GLOB` uses Unix shell-style wildcards (`*` and `?`) and is case-sensitive.
`LIKE` uses SQL wildcards (`%` and `_`) and is case-insensitive for ASCII
by default.

---

Select users whose `age` is between 18 and 30 inclusive.

. . .

```sql
SELECT *
FROM users
WHERE age BETWEEN 18 AND 30;
```

---

Select users whose `role` is one of `admin`, `editor`, or `viewer`.

. . .

```sql
SELECT *
FROM users
WHERE role IN ('admin', 'editor', 'viewer');
```

---

Find users that are *not* admins.

. . .

```sql
SELECT *
FROM users
WHERE role <> 'admin';
```

---

How do you combine multiple boolean conditions in a `WHERE` clause?

. . .

Use `AND`, `OR`, and `NOT` (parenthesize when mixing them):

```sql
WHERE (role = 'admin' OR role = 'editor')
  AND active = 1;
```

---

Sort users by `age` ascending.

. . .

```sql
SELECT *
FROM users
ORDER BY age ASC;
```

(`ASC` is the default and can be omitted.)

---

Sort users by `age` descending, then by `name` ascending as tiebreaker.

. . .

```sql
SELECT *
FROM users
ORDER BY age DESC, name ASC;
```

---

Return only the first 10 rows of a query.

. . .

```sql
SELECT *
FROM users
LIMIT 10;
```

---

Return rows 21..30 of a query (i.e. paginate, page size 10, page 3).

. . .

```sql
SELECT *
FROM users
LIMIT 10 OFFSET 20;
```

---

Return only the distinct values of `role` from the `users` table.

. . .

```sql
SELECT DISTINCT role
FROM users;
```

---

Count the total number of rows in `users`.

. . .

```sql
SELECT count(*) FROM users;
```

---

Count the number of non-NULL emails in `users`.

. . .

```sql
SELECT count(email) FROM users;
```

(`count(column)` skips `NULL` values; `count(*)` counts all rows.)

---

Count the number of distinct roles in `users`.

. . .

```sql
SELECT count(DISTINCT role) FROM users;
```

---

What aggregate functions does SQLite provide out of the box?

. . .

- `count(...)`
- `sum(...)`
- `total(...)` — like `sum` but always returns a `REAL` and `0.0` instead of NULL
- `avg(...)`
- `min(...)`
- `max(...)`
- `group_concat(...)` (also `string_agg` in 3.44+)

---

Compute the average `age` per `role`.

. . .

```sql
SELECT role, avg(age)
FROM users
GROUP BY role;
```

---

What does `HAVING` do?

. . .

`HAVING` filters *groups* produced by `GROUP BY`,
in the same way `WHERE` filters individual rows.
It runs after grouping and aggregation, so it can refer to aggregate values.

---

List roles with more than 5 users.

. . .

```sql
SELECT role, count(*) AS n
FROM users
GROUP BY role
HAVING n > 5;
```

---

What's the difference between `WHERE` and `HAVING`?

. . .

`WHERE` filters rows *before* grouping/aggregation.
`HAVING` filters groups *after* aggregation
and can therefore reference aggregate functions.

---

Concatenate all user names into a single comma-separated string.

. . .

```sql
SELECT group_concat(name, ', ')
FROM users;
```

---

What is the logical order in which a `SELECT` query is evaluated?

. . .

1. `FROM` / `JOIN`
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT` (and window functions)
6. `DISTINCT`
7. `ORDER BY`
8. `LIMIT` / `OFFSET`

---

Give each row an alias for a table.

. . .

```sql
SELECT u.name
FROM users AS u;
```

(`AS` is optional: `FROM users u` also works.)

---

Alias a column in the output.

. . .

```sql
SELECT name AS full_name
FROM users;
```

---

Join `users` with `orders` on matching `user_id`.

. . .

```sql
SELECT u.name, o.total
FROM users AS u
JOIN orders AS o
  ON o.user_id = u.id;
```

---

What is the difference between `INNER JOIN` and `LEFT JOIN`?

. . .

- `INNER JOIN` keeps only rows that have a match on both sides.
- `LEFT JOIN` keeps every row of the left table; unmatched right-side columns
  become `NULL`.

---

Does SQLite support `RIGHT JOIN` and `FULL OUTER JOIN`?

. . .

Only since SQLite 3.39 (2022). Older versions support only `INNER`, `LEFT`,
and `CROSS` joins; `RIGHT` had to be simulated by swapping the tables.

---

Find users who have no orders.

. . .

```sql
SELECT u.*
FROM users AS u
LEFT JOIN orders AS o
  ON o.user_id = u.id
WHERE o.id IS NULL;
```

---

Cartesian product of `users` and `roles`.

. . .

```sql
SELECT *
FROM users CROSS JOIN roles;
```

(Equivalent to `FROM users, roles` without any join condition.)

---

What is a self-join? Show an example.

. . .

Joining a table to itself, typically via aliases.

```sql
SELECT e.name AS employee, m.name AS manager
FROM employees AS e
JOIN employees AS m
  ON e.manager_id = m.id;
```

---

What is a CTE (Common Table Expression)?

. . .

A named, temporary result set defined within a single SQL statement using
`WITH`. It improves readability and allows recursion.

```sql
WITH adults AS (
  SELECT * FROM users WHERE age >= 18
)
SELECT * FROM adults WHERE active = 1;
```

---

Write a recursive CTE that generates numbers 1..10.

. . .

```sql
WITH RECURSIVE numbers(n) AS (
  SELECT 1
  UNION ALL
  SELECT n + 1 FROM numbers WHERE n < 10
)
SELECT n FROM numbers;
```

---

Combine two queries and remove duplicates.

. . .

```sql
SELECT name FROM employees
UNION
SELECT name FROM contractors;
```

---

Combine two queries while keeping duplicates.

. . .

```sql
SELECT name FROM employees
UNION ALL
SELECT name FROM contractors;
```

---

What other set operators does SQLite support besides `UNION`?

. . .

- `UNION ALL`
- `INTERSECT` — rows present in both
- `EXCEPT` — rows present in the first but not the second

---

What is a subquery?

. . .

A `SELECT` statement nested inside another statement.
It can appear in the `SELECT`, `FROM`, `WHERE`, or `HAVING` clauses.

```sql
SELECT *
FROM users
WHERE id IN (SELECT user_id FROM orders);
```

---

What does `EXISTS` do?

. . .

Returns `1` if a subquery yields at least one row, otherwise `0`.

```sql
SELECT *
FROM users u
WHERE EXISTS (
  SELECT 1 FROM orders o WHERE o.user_id = u.id
);
```

---

Write a `CASE` expression that maps `age` ranges to labels.

. . .

```sql
SELECT
  name,
  CASE
    WHEN age < 18 THEN 'minor'
    WHEN age < 65 THEN 'adult'
    ELSE 'senior'
  END AS category
FROM users;
```

---

Return `0` instead of `NULL` when summing an empty/NULL column.

. . .

Use `coalesce` or `total`:

```sql
SELECT coalesce(sum(amount), 0) FROM payments;
-- or
SELECT total(amount) FROM payments;
```

---

What does `coalesce(a, b, c)` do?

. . .

Returns the first non-NULL argument; if all are NULL, returns NULL.

---

What does `nullif(a, b)` do?

. . .

Returns `NULL` if `a == b`, otherwise returns `a`.
Useful for turning sentinel values into NULLs.

---

What does `ifnull(a, b)` do?

. . .

Returns `a` if it is not NULL, otherwise `b`.
(Two-argument form of `coalesce`.)

---

What is the difference between `NULL` and `0` or `''` in SQL?

. . .

`NULL` represents "unknown" or "absent".
Any arithmetic or comparison involving `NULL` yields `NULL`
(except `IS NULL` / `IS NOT NULL`).
`0` and `''` are concrete known values.

---

Create an index on `users(email)`.

. . .

```sql
CREATE INDEX idx_users_email ON users(email);
```

---

Create a unique index on `users(email)`.

. . .

```sql
CREATE UNIQUE INDEX idx_users_email ON users(email);
```

---

Drop the index `idx_users_email`.

. . .

```sql
DROP INDEX idx_users_email;
```

---

Why would you create a composite index over `(a, b)` rather than two separate
indexes on `a` and `b`?

. . .

A composite index can satisfy queries that filter on `a` and `b` together
(and queries on just `a`) much more efficiently than two single-column
indexes, because SQLite can typically use only one index per table per query.

The leftmost column rule applies: an index on `(a, b)` is useful for `WHERE a=?`
and `WHERE a=? AND b=?`, but not for `WHERE b=?` alone.

---

Create a view that returns all active users.

. . .

```sql
CREATE VIEW active_users AS
SELECT * FROM users WHERE active = 1;
```

---

Drop a view.

. . .

```sql
DROP VIEW active_users;
```

---

Are SQLite views writable?

. . .

By default, views are read-only.
You can make them writable by attaching `INSTEAD OF` triggers
(`INSTEAD OF INSERT`, `INSTEAD OF UPDATE`, `INSTEAD OF DELETE`).

---

What is the syntax for a basic transaction?

. . .

```sql
BEGIN;
  -- ... statements ...
COMMIT;
```

To abort instead, use `ROLLBACK;` in place of `COMMIT;`.

---

What's the difference between `BEGIN`, `BEGIN DEFERRED`, `BEGIN IMMEDIATE`,
and `BEGIN EXCLUSIVE`?

. . .

- `DEFERRED` (default) — no lock is acquired until the first read/write.
- `IMMEDIATE` — acquires a write lock immediately, blocking other writers
  but allowing readers.
- `EXCLUSIVE` — acquires an exclusive lock immediately (legacy rollback
  journal mode); behaves like `IMMEDIATE` in WAL mode.

---

What is a savepoint?

. . .

A named, nestable rollback point within a transaction.

```sql
SAVEPOINT s1;
  -- ...
RELEASE s1;          -- or:
ROLLBACK TO s1;
```

---

Why are bulk inserts dramatically faster inside a transaction?

. . .

By default each statement is its own implicit transaction with its own fsync.
Wrapping many inserts in a single `BEGIN`/`COMMIT` block performs only one
fsync at the end, often making bulk loads 100x+ faster.

---

What is the foreign key syntax for a `posts.user_id` referencing `users.id`?

. . .

```sql
CREATE TABLE posts (
  id INTEGER PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  title TEXT NOT NULL
);
```

---

Why might a defined foreign key not actually be enforced in SQLite?

. . .

Foreign key enforcement is **disabled by default** in SQLite for historical
backwards-compatibility reasons. You must enable it per connection:

```sql
PRAGMA foreign_keys = ON;
```

---

How do you set up `ON DELETE CASCADE` on a foreign key?

. . .

```sql
CREATE TABLE posts (
  id INTEGER PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);
```

---

What `ON DELETE` / `ON UPDATE` actions are available?

. . .

- `NO ACTION` (default) — error at end of statement
- `RESTRICT` — error immediately
- `SET NULL` — set referencing column to NULL
- `SET DEFAULT` — set referencing column to its default value
- `CASCADE` — propagate the delete/update

---

Add a `CHECK` constraint that `age` must be non-negative.

. . .

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  age INTEGER CHECK (age >= 0)
);
```

---

Give a column a default value of the current time.

. . .

```sql
created_at TEXT NOT NULL DEFAULT (datetime('now'))
```

---

What is an "upsert" in SQLite?

. . .

An `INSERT` that falls back to an `UPDATE` (or does nothing) when a uniqueness
constraint would be violated.

```sql
INSERT INTO users(id, name) VALUES (1, 'Alice')
ON CONFLICT(id) DO UPDATE SET name = excluded.name;
```

---

What does the `excluded` keyword refer to in an `ON CONFLICT` clause?

. . .

The row that *would* have been inserted (the conflicting incoming row).
`excluded.col` gives access to its column values.

---

Insert a row but do nothing if it conflicts.

. . .

```sql
INSERT INTO users(id, name) VALUES (1, 'Alice')
ON CONFLICT DO NOTHING;
```

---

What does `INSERT OR REPLACE` do?

. . .

If the insert violates a uniqueness constraint, SQLite deletes the conflicting
row(s) and inserts the new one.

Beware: this can cascade-delete other rows via foreign keys
and triggers `ON DELETE` actions.

---

What are the alternative conflict-resolution keywords for `INSERT`?

. . .

`INSERT OR REPLACE`, `INSERT OR IGNORE`, `INSERT OR ROLLBACK`,
`INSERT OR ABORT` (default), `INSERT OR FAIL`.

---

Get the rowid of the row inserted by the most recent `INSERT`.

. . .

```sql
SELECT last_insert_rowid();
```

---

Return inserted rows from an `INSERT` (e.g. to get a generated id).

. . .

```sql
INSERT INTO users(name) VALUES ('Alice')
RETURNING id;
```

(Available since SQLite 3.35.)

---

What is `PRAGMA` used for?

. . .

A SQLite-specific command to query or modify internal database settings
(rather than user data).

```sql
PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
```

---

What is `PRAGMA journal_mode = WAL` and why use it?

. . .

Switches the database to Write-Ahead Logging mode, which:

- allows concurrent readers and a writer,
- typically gives better write performance,
- replaces the traditional rollback journal with `db-wal` + `db-shm` sidecar files.

It is the recommended journaling mode for most applications.

---

List the available SQLite journal modes.

. . .

- `DELETE` (default) — rollback journal deleted at commit
- `TRUNCATE` — truncated instead of deleted (faster on some filesystems)
- `PERSIST` — header zeroed, file kept
- `MEMORY` — journal kept in RAM (less safe)
- `WAL` — write-ahead log
- `OFF` — no journal (unsafe; transactions cannot be rolled back)

---

Show the schema version with a PRAGMA.

. . .

`PRAGMA schema_version;`

---

Check the integrity of the database.

. . .

`PRAGMA integrity_check;`

---

Reclaim free space from the database file.

. . .

```sql
VACUUM;
```

(Or `PRAGMA auto_vacuum = ...;` to set automatic vacuuming.)

---

Attach a second database file under the alias `aux`.

. . .

```sql
ATTACH DATABASE 'other.db' AS aux;
```

Access its tables with `aux.tablename`.

---

Detach a previously attached database.

. . .

```sql
DETACH DATABASE aux;
```

---

Show the query plan that SQLite would use for a query.

. . .

```sql
EXPLAIN QUERY PLAN
SELECT * FROM users WHERE email = ?;
```

---

What's the difference between `EXPLAIN` and `EXPLAIN QUERY PLAN`?

. . .

- `EXPLAIN` shows the raw VDBE bytecode SQLite will run (very low-level).
- `EXPLAIN QUERY PLAN` gives a human-readable summary of join order and
  index usage — usually what you want for query tuning.

---

How do you write a single-line SQL comment?

. . .

`-- this is a comment`

---

How do you write a multi-line SQL comment?

. . .

```sql
/* this is a
   multi-line comment */
```

---

Get the current date as ISO 8601 text (e.g. `2026-05-12`).

. . .

```sql
SELECT date('now');
```

---

Get the current UTC date and time as text.

. . .

```sql
SELECT datetime('now');
```

---

Get the current local date and time as text.

. . .

```sql
SELECT datetime('now', 'localtime');
```

---

Format a timestamp with `strftime`.

. . .

```sql
SELECT strftime('%Y-%m-%d %H:%M', 'now');
```

---

Get the Unix epoch (seconds since 1970-01-01 UTC) of right now.

. . .

```sql
SELECT strftime('%s', 'now');
```

or

```sql
SELECT unixepoch();
```

---

Convert a Unix epoch integer `t` to an ISO 8601 datetime string.

. . .

```sql
SELECT datetime(t, 'unixepoch');
```

---

Add 7 days to today.

. . .

```sql
SELECT date('now', '+7 days');
```

---

Get the first day of the current month.

. . .

```sql
SELECT date('now', 'start of month');
```

---

Get the length of the string `s`.

. . .

`length(s)`

---

Get the byte length of a `BLOB` `b`.

. . .

`length(b)` (also returns bytes for `BLOB`).
For text, use `length(s)` for characters and `octet_length(s)` for bytes
(3.43+).

---

Lowercase a string.

. . .

`lower(s)`

(Only ASCII is lowercased by default; load `ICU` extension for full Unicode.)

---

Uppercase a string.

. . .

`upper(s)`

---

Trim leading and trailing whitespace from `s`.

. . .

`trim(s)`

You can also pass a second argument with characters to trim:
`trim(s, 'xy')`.

---

Replace all occurrences of `'old'` with `'new'` in `s`.

. . .

`replace(s, 'old', 'new')`

---

Take a substring starting at position 2 with length 5.

. . .

`substr(s, 2, 5)`

(SQLite uses 1-based positions; negative positions count from the end.)

---

Concatenate two strings.

. . .

```sql
SELECT 'foo' || 'bar';
```

(SQLite uses `||` for string concatenation, **not** `+`.)

---

Cast `'42'` to an integer.

. . .

```sql
SELECT CAST('42' AS INTEGER);
```

---

What is a window function?

. . .

A function that computes a value across a set of rows related to the current
row, without collapsing the result set the way `GROUP BY` does.

```sql
SELECT
  name,
  salary,
  avg(salary) OVER (PARTITION BY department) AS avg_dept_salary
FROM employees;
```

(Available in SQLite 3.25+.)

---

Number rows of a result set 1, 2, 3, ...

. . .

```sql
SELECT
  row_number() OVER (ORDER BY created_at) AS n,
  *
FROM users;
```

---

What's the difference between `row_number()`, `rank()`, and `dense_rank()`?

. . .

- `row_number()` — always 1, 2, 3, ... even on ties
- `rank()` — gives ties the same rank and leaves gaps (1, 2, 2, 4)
- `dense_rank()` — ties get the same rank, no gaps (1, 2, 2, 3)

---

Reference the previous row's value in a window.

. . .

```sql
SELECT
  date,
  value,
  lag(value) OVER (ORDER BY date) AS prev_value
FROM measurements;
```

(`lead(...)` does the opposite — peeks ahead.)

---

What is a generated column?

. . .

A column whose value is computed from other columns automatically.

```sql
CREATE TABLE orders (
  qty INTEGER,
  price REAL,
  total REAL GENERATED ALWAYS AS (qty * price) STORED
);
```

`STORED` saves the value on disk; `VIRTUAL` (default) recomputes on read.

---

How can you store JSON in SQLite?

. . .

Just as `TEXT`. SQLite has a built-in JSON1 set of functions to operate on
it: `json`, `json_extract`, `json_object`, `json_array`, `json_each`, ...

```sql
SELECT json_extract(payload, '$.user.name')
FROM events;
```

---

Shorthand for `json_extract(col, '$.path')` in modern SQLite.

. . .

```sql
SELECT col -> '$.path'     -- returns JSON
SELECT col ->> '$.path'    -- returns SQL value (text/number/etc.)
```

(Available since SQLite 3.38.)

---

Build a JSON object inline.

. . .

```sql
SELECT json_object('name', name, 'age', age) FROM users;
```

---

Iterate over the elements of a JSON array column.

. . .

```sql
SELECT u.id, t.value AS tag
FROM users AS u, json_each(u.tags) AS t;
```

(`json_each` exposes a JSON value as a virtual table of key/value pairs.)

---

What is `FTS5` in SQLite?

. . .

A full-text search engine implemented as a virtual table module.
You create a special table and SQLite maintains an inverted index for fast
text search.

```sql
CREATE VIRTUAL TABLE docs USING fts5(title, body);
SELECT * FROM docs WHERE docs MATCH 'sqlite AND index';
```

---

Define a trigger that updates `updated_at` on every row update.

. . .

```sql
CREATE TRIGGER users_set_updated_at
AFTER UPDATE ON users
FOR EACH ROW
BEGIN
  UPDATE users
  SET updated_at = datetime('now')
  WHERE id = OLD.id;
END;
```

---

What are `OLD` and `NEW` in a trigger?

. . .

References to the row before (`OLD`) and after (`NEW`) the triggering
operation:

- `INSERT` trigger — only `NEW` is defined.
- `DELETE` trigger — only `OLD` is defined.
- `UPDATE` trigger — both `OLD` and `NEW` are defined.

---

What's the difference between `BEFORE`, `AFTER`, and `INSTEAD OF` triggers?

. . .

- `BEFORE` — runs before the operation; can modify the action via `NEW.*`.
- `AFTER` — runs after the operation has been applied.
- `INSTEAD OF` — only valid on **views**; the trigger body *replaces* the
  operation entirely.

---

Drop a trigger.

. . .

```sql
DROP TRIGGER users_set_updated_at;
```

---

What does `random()` return in SQLite?

. . .

A pseudo-random signed 64-bit integer
(between -9223372036854775808 and 9223372036854775807).
For a value in `[0, 1)`, use `abs(random()) / 9223372036854775807.0`.

---

Pick a random row from `users`.

. . .

```sql
SELECT * FROM users
ORDER BY random()
LIMIT 1;
```

(Fine for small tables; expensive on large ones because it sorts all rows.)

---

How do parameterized queries look in raw SQL?

. . .

```sql
SELECT * FROM users WHERE id = ?;
```

Or named parameters:

```sql
SELECT * FROM users WHERE id = :id;
SELECT * FROM users WHERE id = @id;
SELECT * FROM users WHERE id = $id;
```

The driver binds the actual value safely (no string interpolation needed).

---

Why should you always use parameterized queries instead of string interpolation?

. . .

To prevent SQL injection. Parameter binding sends the value separately from
the SQL text, so it can never be parsed as code regardless of its contents.

---

What table stores SQLite's schema definitions internally?

. . .

`sqlite_schema` (previously `sqlite_master` — still works as an alias).

```sql
SELECT name, sql FROM sqlite_schema WHERE type = 'table';
```

---

How do you find all tables matching a pattern?

. . .

```sql
SELECT name FROM sqlite_schema
WHERE type = 'table'
  AND name LIKE 'user_%';
```

---

How can you inspect the columns of a table from SQL?

. . .

Use the `pragma_table_info` table-valued function:

```sql
SELECT name, type, "notnull", pk
FROM pragma_table_info('users');
```

(Or the dot command: `.schema users` / `PRAGMA table_info(users);`.)

---

Is SQL case-sensitive?

. . .

- **Keywords and identifiers** — case-insensitive (`SELECT` = `select`,
  `users` = `Users`).
- **String values** — case-sensitive (`'Alice' <> 'alice'`).
- **`LIKE`** — case-insensitive for ASCII by default
  (configurable via `PRAGMA case_sensitive_like`).
- **`GLOB`** — case-sensitive.

---

How do you write a string that contains a single quote?

. . .

Double it up:

```sql
SELECT 'It''s a test';
```

---

How do you write a string that contains a backslash?

. . .

Just write it. SQLite does **not** interpret backslash escapes in normal
string literals — `'\n'` is two characters: backslash and `n`.

---

What is `WITHOUT ROWID` and when is it useful?

. . .

A table option that omits the implicit `ROWID` and uses the declared
primary key as the clustering key instead. Useful for:

- tables where a non-integer PK is heavily used,
- saving space when `ROWID` is never referenced,
- avoiding the second lookup that PK → rowid → row would require.

```sql
CREATE TABLE kv (
  key TEXT PRIMARY KEY,
  value TEXT
) WITHOUT ROWID;
```

---

What's the size limit of a SQLite database file?

. . .

Up to 281 TB (2^48 bytes) in theory, with a default page size of 4096 bytes.
In practice, far larger than most use cases, but practical limits come from
the filesystem and memory.

---

What's the maximum length of a single TEXT or BLOB value?

. . .

`SQLITE_MAX_LENGTH`, which defaults to 1,000,000,000 bytes (1 GB).
Configurable at compile time.

---

Is SQLite a client-server database?

. . .

No. SQLite is a self-contained, **embedded** library. There is no separate
server process; the database lives in a single file and the application
calls into the SQLite library directly.

---

What does ACID stand for, and does SQLite provide all four?

. . .

- **A**tomicity
- **C**onsistency
- **I**solation
- **D**urability

Yes — SQLite is fully ACID-compliant (assuming the underlying filesystem
honors fsync correctly).

---

Default isolation level in SQLite.

. . .

`SERIALIZABLE` (the strongest standard isolation level).

Writers are fully serialized; readers see a consistent snapshot via either
the rollback journal or the WAL.

---

Are SQLite database files portable between platforms?

. . .

Yes. The file format is platform- and endianness-independent.
You can copy a SQLite file from a 64-bit Linux machine to a 32-bit Windows
machine and open it without conversion.

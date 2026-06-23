# PostgreSQL Employee Management Database

A hands-on PostgreSQL project to practice database design, relationships, and SQL querying.

## Tech Stack
- PostgreSQL 18
- Docker
- WSL Ubuntu

## Schema

- **departments** — stores department info
- **employees** — stores employee details, linked to departments
- **salaries** — stores salary records, linked to employees

## How to Run

1. Start the container:
```bash
docker run --name pg-learn -e POSTGRES_PASSWORD=admin123 -p 5432:5432 -d postgres
```

2. Load the schema:
```bash
docker exec -i pg-learn psql -U postgres -f - < schema.sql
```

3. Load the data:
```bash
docker exec -i pg-learn psql -U postgres -f - < seed.sql
```

4. Connect and run queries:
```bash
docker exec -it pg-learn psql -U postgres -d empdb
```

## Queries Covered
- Employee and department JOIN
- Salary ranking
- Highest paid employee
- Department headcount
- Employees hired after a specific date
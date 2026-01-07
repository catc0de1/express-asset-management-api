# Resource & Asset Management API

Backend API for managing organizational resources and assets using **Express**, **GraphQL Yoga**, **TypeScript**, and **PostgreSQL**.

This project is designed as a backend-first, industry-oriented system, focusing on clean architecture, explicit data modeling, and GraphQL best practices. This API implement GraphQL as **query language**, not REST replacement.

---

## Features (Planned & In Progress)

- GraphQL API using GraphQL Yoga
- Express-based server architecture
- Strongly typed with TypeScript
- Asset & resource management domain
- PostgreSQL as primary database
- Manual SQL queries (no ORM at early stage)
- Designed for separation from frontend (React client later)

---

## Domain Overview

This system manages organizational assets such as hardware, software, or infrastructure resources.

### Core Concepts

- **Asset**: A physical or logical resource (e.g. laptop, server)
- **Asset Type**: Classification of assets (Laptop, Server, Router, etc.)
- **Location**: Physical or logical placement of assets
- **Assignment**: Usage history and ownership tracking of assets

The system is designed to be stateful, auditable, and scalable.

---

## Tech Stack

|Layer          |Technology                   |
|---------------|-----------------------------|
|Runtime        |Node.js                      |
|Server         |Express                      |
|API            |GraphQL (GraphQL Yoga)       |
|Language       |TypeScript                   |
|Database       |PostgreSQL                   |
|Database Access|Manual SQL                   |
|Frontend       |Not included (planned: React)|

---

## Project Structure

```
resource-asset-api/
├─ src/
│  ├─ graphql/
│  │  ├─ schema.ts
│  │  └─ resolvers/
│  ├─ db/
│  │  └─ index.ts
│  ├─ app.ts
│  └─ server.ts
├─ sql/
│  └─ schema.sql
├─ tsconfig.json
├─ package.json
└─ README.md
```

---

## Getting Started

1. **Install dependencies**
   
    ```bash
    pnpm install
    ```

2. **Run development server**

    ```bash
    pnpm dev
    ```

3. **Open GraphQL Playground**
   
    ```bash
    http://localhost:4000/graphql
    ```

    Test query:

    ```graphql
    {
      health
    }
    ```

---

## Database Schema

Database schema is defined manually in:

```
sql/schema.sql
```

Includes:

- **asset_types**
- **locations**
- **assets**
- **assignments**

The schema is designed to support:

- **Strong relational integrity**
- **Audit trails**
- **Future extensions (metadata, auth, roles)**

---

## Roadmap

### Phase 1 – Core Backend

- [x] Project setup
- [x] Database schema design
- [ ] GraphQL types & resolvers
- [x] PostgreSQL integration

### Phase 2 – Business Logic

- [ ] Asset assignment logic
- [ ] Status transitions
- [ ] Validation & error handling

### Phase 3 – Infrastructure

- [ ] Authentication & authorization
- [ ] Logging & monitoring
- [ ] Transactions & concurrency handling

### Phase 4 – Client

- [ ] React client (separate project)
- [ ] Apollo Client integration

---

## Notes

- This project intentionally avoids ORM in early stages to ensure deep understanding of SQL and data flow.

- GraphQL schema will closely follow database structure, with additional business logic layers.

---

## License

[MIT Licensed](https://github.com/catc0de1/express-asset-management-api?tab=MIT-1-ov-file)
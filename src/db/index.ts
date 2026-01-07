import { Pool } from "pg";

const {
  DB_HOST,
  DB_PORT,
  DB_NAME,
  DB_USERNAME,
  DB_PASSWORD,
  NODE_ENV,
} = process.env;

export const pool = new Pool({
  host: DB_HOST,
  port: Number(DB_PORT),
  database: DB_NAME,
  user: DB_USERNAME,
  password: DB_PASSWORD,
  ssl: NODE_ENV === 'production' ? true : false,
  max: 10,
  idleTimeoutMillis: 30_000,
  connectionTimeoutMillis: 5_000,
});

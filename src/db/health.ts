import { pool } from "./index";

export async function checkDb() {
  await pool.query("SELECT 1");
  console.log("PostgreSQL connected");
}

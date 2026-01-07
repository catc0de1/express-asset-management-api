import "dotenv/config";
import { createApp } from "./app";
import { checkDb } from "./db/health";

const app = createApp();

const PORT = process.env.PORT || 4000;

(async () => {
  try {
    await checkDb();
    app.listen(PORT, () => console.log(`\nServer running at http://localhost:${PORT}/graphql`));
  } catch (err) {
    console.error("Error:", err);
    process.exit(1);
  }
})();

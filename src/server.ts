import { createApp } from "./app";

const app = createApp();

const PORT = 4000;

app.listen(PORT, () => {
  console.log(`\nServer running at http://localhost:${PORT}/graphql`);
});

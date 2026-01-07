import express from "express";
import { createYoga } from "graphql-yoga";
import { schema } from "./graphql/schema";

export function createApp() {
  const app = express();

  const yoga = createYoga({
    schema,
    graphqlEndpoint: "/graphql"
  });

  app.use("/graphql", yoga);

  return app;
}

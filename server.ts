import { serve } from "@hono/node-server";
import { Hono } from "hono";

const app = new Hono().basePath("/api");

app.get("/", (c) => {
  console.log("testing console log");

  return c.text("Hello Hono!");
});

app.get("/random", (c) => {
  return c.json({ random: Math.random() });
});

let count = 0;
app.get("/count", (c) => {
  return c.json({ count: count++ });
});

serve(
  {
    fetch: app.fetch,
    port: 7777,
  },
  (info) => {
    console.log(`Server is running on http://localhost:${info.port}`);
  }
);

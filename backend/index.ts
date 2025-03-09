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

const port =
  process.env.NODE_ENV === "development" ? 7777 : process.env.PORT || 3000;

serve(
  {
    fetch: app.fetch,
    port: Number(port),
  },
  (info) => {
    console.log(`Server is running on port ${info.port}`);
  }
);

module.exports = function trackEvent(req, res) {
  const { event, payload } = req.body || {};

  if (!event) {
    return res.status(400).json({ error: "missing event" });
  }

  const record = {
    ts: Date.now(),
    event,
    payload: payload || {}
  };

  // append-only log
  require("fs").appendFileSync(
    "backend/logs/ui-events.jsonl",
    JSON.stringify(record) + "\n"
  );

  res.json({ status: "ok" });
};

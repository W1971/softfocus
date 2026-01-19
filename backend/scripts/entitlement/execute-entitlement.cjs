import fs from 'fs';

export function executeEntitlement({ runId, productId, paymentRef }) {
  const record = {
    run_id: runId,
    product_id: productId,
    payment_ref: paymentRef,
    severity: 'PASS',
    timestamp: new Date().toISOString()
  };

  fs.appendFileSync(
    'run.jsonl',
    JSON.stringify(record) + '\n',
    'utf-8'
  );

  return record;
}

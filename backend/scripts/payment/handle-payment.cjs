import { normalizePaymentEvent } from './payment-adapter.cjs';
import { executeEntitlement } from '../entitlement/execute-entitlement.cjs';

export function handlePayment(event) {
  const payment = normalizePaymentEvent(event);

  if (payment.status !== 'paid') {
    return { severity: 'IGNORE' };
  }

  return executeEntitlement({
    runId: `payment-${payment.paymentRef}`,
    productId: payment.productId,
    paymentRef: payment.paymentRef
  });
}

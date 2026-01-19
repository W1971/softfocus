import { mapStripeEvent } from './providers/stripe.cjs';
import { handlePayment } from './handle-payment.cjs';

export function handleStripeEvent(event) {
  const normalized = mapStripeEvent(event);
  return handlePayment(normalized);
}

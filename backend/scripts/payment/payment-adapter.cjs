export function normalizePaymentEvent(event) {
  return {
    paymentRef: event.payment_ref,
    productId: event.product_id,
    amount: event.amount,
    currency: event.currency,
    status: event.status
  };
}

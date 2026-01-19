export function mapStripeEvent(event) {
  return {
    payment_ref: event.id,
    product_id: event.metadata.product_id,
    amount: event.amount_total,
    currency: event.currency,
    status: event.payment_status === 'paid' ? 'paid' : 'ignored'
  };
}

# Payment Providers

Supported model:
- Provider-specific event mapping
- Provider-agnostic entitlement execution

Rules:
- Providers do not grant access
- Providers only emit payment signals
- Entitlement remains the single source of truth

Providers can be replaced without refactoring product logic.

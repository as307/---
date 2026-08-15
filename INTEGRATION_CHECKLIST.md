# Combo Tool Integration Checklist (EN + AR)

## English

### How to Use This Checklist
- Use this repository as a blueprint tracker, not as a full runtime deployment.
- Complete phases in order: **Phase 1 (MVP)** first, then Phase 2+, then production readiness.
- Mark each item only after implementation is complete and validated.
- Before closing a phase, run all items in **Quick Validation (Copy/Paste)**.

### Phase 1 — Foundation (MVP)
- [ ] Deploy **Dify** as the main workflow orchestrator
- [ ] Create one end-to-end workflow entrypoint in Dify
- [ ] Connect **gpt-researcher** as a research tool/service
- [ ] Connect **khoj** for persistent memory storage
- [ ] Define one shared data schema for workflow outputs

### Phase 2 — Action Layer
- [ ] Integrate **agent-browser** for deterministic website actions
- [ ] Add retries/timeouts for browser tasks
- [ ] Add basic observability (success/failure logs per step)
- [ ] Add fallback path when browser automation fails

### Phase 3 — Optional Runtime Extensions
- [ ] Integrate **nanobot** for custom Python-based tasks
- [ ] Define clear boundaries between Dify-managed and nanobot-managed tasks
- [ ] Add permission controls for runtime-executed actions

### Phase 4 — Skill Upgrades
- [ ] Add **request-router** skill for automatic path selection
- [ ] Add **human-approval-gate** before posting/purchasing/deleting actions
- [ ] Add **evaluation-qa** scoring for output quality
- [ ] Add **monitoring-observability** for latency/failure/cost
- [ ] Add **retry-fallback** policy for model/tool/cache fallback

### Phase 5 — New Skills Expansion
- [ ] Add **arabic-first-nlp** (intent/entity extraction + dialect normalization)
- [ ] Add **ocr-document-ingestion** (PDF/image to structured text)
- [ ] Add **knowledge-sync** (tag/version sync into khoj)
- [ ] Add **scheduling-trigger** (time/event automation)
- [ ] Add **security-compliance** (PII redaction + policy checks + audit logs)

### Phase 6 — Production Readiness
- [ ] Add alerting for failed runs
- [ ] Add backup/restore for memory and workflow configs
- [ ] Document operational runbooks (incident + rollback)

### Quick Validation (Copy/Paste)
- [ ] Router selects the expected execution path for sample requests
- [ ] High-risk actions are blocked until human approval is provided
- [ ] QA scores are generated with citations and pass/fail status
- [ ] Arabic text is normalized with intents/entities extracted
- [ ] OCR documents are converted and indexed in khoj
- [ ] Compliance checks redact PII and generate audit IDs

---

## العربية

### كيفية استخدام قائمة التحقق
- استخدم هذا المستودع كمرجع تخطيطي للتتبع وليس كبيئة تشغيل متكاملة.
- نفّذ المراحل بالترتيب: **المرحلة 1 (MVP)** أولاً ثم المراحل التالية ثم جاهزية الإنتاج.
- علِّم كل بند بعد اكتمال التنفيذ والتحقق منه.
- قبل إغلاق أي مرحلة، نفّذ عناصر **التحقق السريع** كاملة.

### المرحلة 1 — الأساس (MVP)
- [ ] نشر **Dify** كمنسّق رئيسي لسير العمل
- [ ] إنشاء نقطة دخول واحدة من البداية للنهاية داخل Dify
- [ ] ربط **gpt-researcher** كأداة/خدمة للبحث
- [ ] ربط **khoj** لحفظ الذاكرة بشكل دائم
- [ ] تعريف مخطط بيانات موحّد لمخرجات سير العمل

### المرحلة 2 — طبقة التنفيذ
- [ ] دمج **agent-browser** لتنفيذ مهام الويب بشكل موثوق
- [ ] إضافة إعادة المحاولة والمهلات الزمنية لمهام المتصفح
- [ ] إضافة مراقبة أساسية (سجلات نجاح/فشل لكل خطوة)
- [ ] إضافة مسار بديل عند فشل أتمتة المتصفح

### المرحلة 3 — امتدادات وقت التشغيل (اختياري)
- [ ] دمج **nanobot** للمهام المخصصة المبنية على بايثون
- [ ] تحديد حدود واضحة بين مهام Dify ومهام nanobot
- [ ] إضافة ضوابط صلاحيات للعمليات المنفذة وقت التشغيل

### المرحلة 4 — ترقية المهارات
- [ ] إضافة مهارة **request-router** لاختيار المسار تلقائياً
- [ ] إضافة **human-approval-gate** قبل النشر/الشراء/الحذف
- [ ] إضافة **evaluation-qa** لتقييم جودة المخرجات
- [ ] إضافة **monitoring-observability** لمتابعة الزمن/الفشل/الكلفة
- [ ] إضافة **retry-fallback** كسياسة بديلة عند الفشل

### المرحلة 5 — توسيع المهارات الجديدة
- [ ] إضافة **arabic-first-nlp** (استخراج النوايا والكيانات + توحيد اللهجات)
- [ ] إضافة **ocr-document-ingestion** (تحويل PDF/الصور إلى نص منظم)
- [ ] إضافة **knowledge-sync** (مزامنة بالوسوم والإصدارات داخل khoj)
- [ ] إضافة **scheduling-trigger** (تشغيل زمني/حدثي)
- [ ] إضافة **security-compliance** (إخفاء PII + فحص السياسات + سجل تدقيق)

### المرحلة 6 — جاهزية الإنتاج
- [ ] إضافة تنبيهات عند فشل التشغيل
- [ ] إضافة نسخ احتياطي/استعادة للذاكرة وإعدادات سير العمل
- [ ] توثيق أدلة التشغيل (الحوادث + التراجع)

### تحقق سريع (نسخ/لصق)
- [ ] يختار الموجّه المسار الصحيح لطلبات تجريبية
- [ ] يتم إيقاف الإجراءات عالية المخاطر حتى اعتماد بشري
- [ ] يتم إنشاء درجات جودة مع المراجع وحالة نجاح/فشل
- [ ] يتم توحيد النص العربي مع استخراج النوايا والكيانات
- [ ] يتم تحويل المستندات عبر OCR وفهرستها داخل khoj
- [ ] يتم إخفاء البيانات الحساسة وإنتاج معرف تدقيق

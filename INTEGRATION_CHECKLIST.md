# Combo Tool Integration Checklist (EN + AR)

## English

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

### Phase 4 — Production Readiness
- [ ] Add scheduling for recurring workflows
- [ ] Add alerting for failed runs
- [ ] Add backup/restore for memory and workflow configs
- [ ] Document operational runbooks (incident + rollback)

### Quick Validation (Copy/Paste)
- [ ] Research request can run from Dify and return structured output
- [ ] Output is stored and searchable in khoj
- [ ] Browser action can execute and report completion
- [ ] Workflow failure path is handled without data loss

---

## العربية

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

### المرحلة 4 — جاهزية الإنتاج
- [ ] إضافة جدولة لسير العمل المتكرر
- [ ] إضافة تنبيهات عند فشل التشغيل
- [ ] إضافة نسخ احتياطي/استعادة للذاكرة وإعدادات سير العمل
- [ ] توثيق أدلة التشغيل (الحوادث + التراجع)

### تحقق سريع (نسخ/لصق)
- [ ] يمكن تشغيل طلب بحث من Dify وإرجاع مخرجات منظمة
- [ ] يتم حفظ المخرجات وإمكانية البحث عنها في khoj
- [ ] يمكن تنفيذ إجراء المتصفح مع تقرير اكتمال واضح
- [ ] يتم التعامل مع مسار الفشل دون فقدان البيانات

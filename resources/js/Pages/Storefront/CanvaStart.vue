<script setup>
import { Head, Link } from '@inertiajs/vue3';
import StoreLayout from '@/Layouts/StoreLayout.vue';
import { onMounted, ref } from 'vue';

const props = defineProps({
    template:  Object,
    canvaUrl:  String,
    submitUrl: String,
});

const canvaOpened = ref(false);

onMounted(() => {
    // Auto-open Canva as soon as the page loads
    const w = window.open(props.canvaUrl, '_blank', 'noopener,noreferrer');
    canvaOpened.value = !!w;
});

function openCanva() {
    window.open(props.canvaUrl, '_blank', 'noopener,noreferrer');
    canvaOpened.value = true;
}
</script>

<template>
    <Head title="التصميم في كانفا" />
    <StoreLayout>
        <div class="cs-wrap">

            <!-- Breadcrumb -->
            <div class="crumb rv">
                <Link :href="route('home')">الرئيسية</Link>
                <span>/</span>
                <Link :href="route('product.show', template.product.slug)">{{ template.product.name }}</Link>
                <span>/</span>
                <span>التصميم</span>
            </div>

            <div class="cs-grid">

                <!-- ─── Left: step tracker ─── -->
                <div class="steps-col rv d1">

                    <!-- Step 1: Open Canva ✅ -->
                    <div class="step-card done">
                        <div class="step-badge">✓</div>
                        <div class="step-body">
                            <div class="step-title">فُتح كانفا تلقائياً</div>
                            <div class="step-desc">ابحث في شريط المهام عن نافذة كانفا أو انقر على الزر أدناه.</div>
                            <a class="open-btn" :href="canvaUrl" target="_blank" rel="noopener noreferrer" @click="canvaOpened = true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                                    <path d="M18 13v6a2 2 0 01-2 2H5a2 2 0 01-2-2V8a2 2 0 012-2h6"/>
                                    <polyline points="15 3 21 3 21 9"/><line x1="10" y1="14" x2="21" y2="3"/>
                                </svg>
                                فتح كانفا مجدداً
                            </a>
                        </div>
                    </div>

                    <!-- Step 2: Edit in Canva -->
                    <div class="step-card" :class="{ active: canvaOpened }">
                        <div class="step-badge">2</div>
                        <div class="step-body">
                            <div class="step-title">صمّم قالبك في كانفا</div>
                            <div class="step-desc">
                                غيّر النصوص والصور والألوان كما تشاء.
                                عند الانتهاء اضغط:
                            </div>
                            <div class="canva-path">
                                <span class="cp-step">مشاركة</span>
                                <span class="cp-arrow">←</span>
                                <span class="cp-step">تحميل</span>
                                <span class="cp-arrow">←</span>
                                <span class="cp-fmt">PNG أو PDF</span>
                            </div>
                        </div>
                    </div>

                    <!-- Step 3: Upload here -->
                    <div class="step-card">
                        <div class="step-badge">3</div>
                        <div class="step-body">
                            <div class="step-title">ارفع الملف هنا</div>
                            <div class="step-desc">بعد التحميل من كانفا، ارفع الملف ليُضاف لسلتك فوراً.</div>
                            <Link :href="submitUrl" class="upload-btn">
                                انتهيت من التصميم — ارفع الملف
                                <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round">
                                    <line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/>
                                </svg>
                            </Link>
                        </div>
                    </div>

                </div>

                <!-- ─── Right: template preview ─── -->
                <div class="preview-col rv d2">
                    <div class="prev-card">
                        <div class="prev-img-wrap">
                            <img v-if="template.preview_image"
                                 :src="'/storage/' + template.preview_image"
                                 :alt="template.name"
                                 class="prev-img">
                            <div v-else class="prev-ph">
                                <span>🎨</span>
                                <p>معاينة القالب</p>
                            </div>
                            <div class="prev-overlay">
                                <div class="canva-badge">
                                    <svg viewBox="0 0 24 24" width="14" height="14" fill="currentColor">
                                        <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                                    </svg>
                                    متوفر في كانفا
                                </div>
                            </div>
                        </div>
                        <div class="prev-info">
                            <div class="prev-name">{{ template.name }}</div>
                            <div class="prev-prod">{{ template.product.name }}</div>
                            <div class="prev-path">{{ template.product.category }} ← {{ template.product.subcategory }}</div>
                        </div>
                    </div>

                    <!-- Tips card -->
                    <div class="tips-card">
                        <div class="tips-title">💡 نصائح للتصميم</div>
                        <ul class="tips-list">
                            <li>استخدم خطوطاً عربية واضحة للنصوص</li>
                            <li>احرص على دقة الصورة (300 DPI للطباعة)</li>
                            <li>صدّر بصيغة PDF للحصول على أفضل جودة</li>
                            <li>اترك هامشاً من الحواف لا يقل عن 5mm</li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </StoreLayout>
</template>

<style scoped>
.cs-wrap { max-width: 1100px; margin: 0 auto; padding: 28px 20px 80px; }

.crumb { font-size: 13px; color: var(--muted); display: flex; align-items: center; gap: 8px; flex-wrap: wrap; margin-bottom: 32px; }
.crumb a { color: var(--muted); text-decoration: none; }
.crumb a:hover { color: var(--ink); }
.crumb span { opacity: .4; }
.crumb span:last-child { opacity: 1; color: var(--ink); font-weight: 600; }

.cs-grid { display: grid; grid-template-columns: 1fr 360px; gap: 28px; align-items: start; }
@media(max-width: 860px) { .cs-grid { grid-template-columns: 1fr; } }

/* ── Steps ── */
.steps-col { display: flex; flex-direction: column; gap: 16px; }

.step-card {
    display: flex; gap: 18px; align-items: flex-start;
    background: var(--bg2); border: 1.5px solid var(--hair);
    border-radius: 20px; padding: 22px 24px;
    transition: border-color .3s, box-shadow .3s;
    opacity: .65;
}
.step-card.done { opacity: 1; border-color: rgba(52,215,127,.4); background: rgba(52,215,127,.04); }
.step-card.active { opacity: 1; border-color: rgba(52,215,127,.25); box-shadow: 0 4px 24px rgba(52,215,127,.1); }

.step-badge {
    width: 36px; height: 36px; border-radius: 50%; flex-shrink: 0;
    background: var(--glass); border: 1.5px solid var(--hair);
    color: var(--muted); font-size: 14px; font-weight: 700;
    display: flex; align-items: center; justify-content: center;
}
.step-card.done .step-badge {
    background: rgba(52,215,127,.15); border-color: rgba(52,215,127,.4);
    color: var(--emerald-soft);
}
.step-card.active .step-badge {
    background: rgba(52,215,127,.15); border-color: rgba(52,215,127,.4);
    color: var(--emerald-soft);
}

.step-body { flex: 1; display: flex; flex-direction: column; gap: 10px; }
.step-title { font-size: 16px; font-weight: 700; color: var(--ink); }
.step-desc { font-size: 13px; color: var(--muted); line-height: 1.6; }

.open-btn {
    display: inline-flex; align-items: center; gap: 8px;
    background: var(--glass); border: 1.5px solid var(--hair);
    border-radius: 12px; padding: 10px 16px;
    font-size: 13px; font-weight: 600; color: var(--ink);
    text-decoration: none; transition: all .3s; width: fit-content;
}
.open-btn:hover { border-color: rgba(52,215,127,.4); color: var(--emerald-soft); }

.canva-path {
    display: flex; align-items: center; gap: 8px; flex-wrap: wrap;
    background: var(--glass); border: 1px solid var(--hair);
    border-radius: 10px; padding: 10px 14px;
}
.cp-step { font-size: 12px; font-weight: 700; color: var(--ink);
           background: var(--bg2); border: 1px solid var(--hair);
           border-radius: 6px; padding: 3px 10px; }
.cp-arrow { font-size: 12px; color: var(--muted); }
.cp-fmt { font-size: 12px; font-weight: 600; color: var(--emerald-soft); }

.upload-btn {
    display: inline-flex; align-items: center; justify-content: center; gap: 10px;
    background: linear-gradient(150deg, var(--emerald-soft), var(--emerald-deep));
    color: var(--on-emerald); border-radius: 14px; padding: 14px 22px;
    font-size: 15px; font-weight: 700; text-decoration: none;
    box-shadow: 0 8px 28px rgba(52,215,127,.25);
    transition: all .3s;
}
.upload-btn:hover { transform: translateY(-2px); box-shadow: 0 14px 40px rgba(52,215,127,.35); }

/* ── Preview col ── */
.prev-card { background: var(--bg2); border: 1px solid var(--hair); border-radius: 20px; overflow: hidden; }
.prev-img-wrap { aspect-ratio: 4/3; overflow: hidden; background: var(--glass); position: relative; }
.prev-img { width: 100%; height: 100%; object-fit: cover; }
.prev-ph { width: 100%; height: 100%; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 10px; font-size: 48px; color: var(--muted); }
.prev-ph p { font-size: 13px; margin: 0; }
.prev-overlay { position: absolute; bottom: 10px; right: 10px; }
.canva-badge { display: inline-flex; align-items: center; gap: 5px; background: rgba(0,0,0,.55); color: #fff; font-size: 11px; font-weight: 600; padding: 5px 11px; border-radius: 999px; backdrop-filter: blur(8px); }
.prev-info { padding: 16px 18px; }
.prev-name { font-size: 15px; font-weight: 700; color: var(--ink); }
.prev-prod { font-size: 13px; color: var(--muted); margin-top: 4px; }
.prev-path { font-size: 11px; color: var(--muted); opacity: .6; margin-top: 3px; }

.tips-card { background: var(--bg2); border: 1px solid var(--hair); border-radius: 20px; padding: 20px; margin-top: 16px; }
.tips-title { font-size: 14px; font-weight: 700; color: var(--ink); margin-bottom: 14px; }
.tips-list { padding: 0; margin: 0; list-style: none; display: flex; flex-direction: column; gap: 10px; }
.tips-list li { font-size: 13px; color: var(--muted); padding-right: 18px; position: relative; line-height: 1.5; }
.tips-list li::before { content: '•'; position: absolute; right: 0; color: var(--emerald-soft); font-weight: 700; }
</style>

<%@ Page Title="Bharat Manav Kalyan Trust &#8212; Service &bull; Dedication &bull; Empowerment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="IndexPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-bg" id="heroBgSlider">
            <asp:Repeater ID="rptHeroSlider" runat="server">
                <ItemTemplate>
                    <div class="hero-slide<%# Container.ItemIndex == 0 ? " is-active" : "" %>"
                         style="background-image:url('<%# ResolveUrl("~/" + Convert.ToString(Eval("ImagePath")).Trim().TrimStart('~','/','\\').Replace("\\","/")) %>');"
                         role="img" aria-label="Hero background"></div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="hero-particles" id="particles"></div>
            <div class="hero-gradient"></div>
        </div>
        <div class="container hero-container">
            <div class="hero-content">
                <div class="hero-badge animate-fade-up" data-delay="0">
                    <span class="badge-dot"></span>
                    <span data-hi="2010 से मानवता की सेवा में">Serving Humanity Since 2010</span>
                </div>
                <h1 class="hero-title animate-fade-up" data-delay="100">
                    <span class="title-hindi"><asp:Literal ID="litHeroHi" runat="server" Text="भारत मानव कल्याण ट्रस्ट"></asp:Literal></span>
                    <span class="title-en"><asp:Literal ID="litHeroEn" runat="server" Text="Bharat Manav Kalyan Trust"></asp:Literal></span>
                </h1>
                <p class="hero-tagline animate-fade-up" data-delay="200">
                    <asp:Literal ID="litHeroTagline" runat="server" Text="सेवा • समर्पण • सशक्तिकरण"></asp:Literal>
                </p>
                <p class="hero-desc animate-fade-up" data-delay="300" data-hi="वटवृक्ष की दृढ़ता में जड़ें जमाए और ज्ञान के प्रकाश से मार्गदर्शित होकर, हम पूरे भारत में समाज के उत्थान के लिए निरंतर कार्यरत हैं।">
                    Rooted in the strength of the Banyan tree and guided by the light of knowledge,
                    we work tirelessly to uplift communities across Bharat.
                </p>
                <div class="hero-buttons animate-fade-up" data-delay="400">
                    <a href="#programs" class="btn btn-primary" data-hi="हमारे कार्यक्रम">Our Programs</a>
                    <a href="<%= ResolveUrl("~/RegistrationNew.aspx") %>" class="btn btn-outline" data-hi="साइन अप">Sign Up</a>
                    <a href="<%= ResolveUrl("~/Donate.aspx") %>" class="btn btn-outline" data-hi="दान करें">Donate</a>
                </div>
            </div>
            <div class="hero-visual animate-scale-in" data-delay="200">
                <div class="hero-showcase">
                    <div class="showcase-orbit showcase-orbit-outer"></div>
                    <div class="showcase-orbit showcase-orbit-inner"></div>
                    <div class="showcase-spotlight"></div>

                    <div class="showcase-frame">
                        <div class="showcase-frame-outer"></div>
                        <div class="showcase-frame-inner">
                            <div class="showcase-logo-wrap">
                                <asp:Image ID="imgHeroLogo" runat="server" CssClass="hero-logo" AlternateText="Bharat Manav Kalyan Trust Logo" ImageUrl="~/site/assets/images/logo.png" />
                            </div>
                        </div>
                    </div>

                    <div class="showcase-badge showcase-badge-1">
                        <span class="badge-icon">🤲</span>
                        <div class="badge-text">
                            <strong>सेवा</strong>
                            <span>Service</span>
                        </div>
                    </div>
                    <div class="showcase-badge showcase-badge-2">
                        <span class="badge-icon">❤️</span>
                        <div class="badge-text">
                            <strong>समर्पण</strong>
                            <span>Dedication</span>
                        </div>
                    </div>
                    <div class="showcase-badge showcase-badge-3">
                        <span class="badge-icon">💪</span>
                        <div class="badge-text">
                            <strong>सशक्तिकरण</strong>
                            <span>Empowerment</span>
                        </div>
                    </div>

                    <div class="showcase-dot showcase-dot-1"></div>
                    <div class="showcase-dot showcase-dot-2"></div>
                    <div class="showcase-dot showcase-dot-3"></div>
                    <div class="showcase-dot showcase-dot-4"></div>
                </div>
            </div>
        </div>
        <div class="hero-scroll">
            <a href="#about" class="scroll-indicator">
                <span class="scroll-text" data-hi="नीचे स्क्रॉल करें">Scroll Down</span>
                <span class="scroll-arrow"></span>
            </a>
        </div>
    </section>

    <!-- About Section -->
    <section class="section about" id="about">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="हमारे बारे में">About Us</span>
                <h2 class="section-title" data-hi="हम कौन हैं">Who We Are</h2>
                <div class="title-underline"></div>
            </div>
            <div class="about-grid">
                <div class="about-image animate-on-scroll">
                    <div class="about-img-frame">
                        <img src="<%= ResolveUrl("~/site/assets/images/ngo_image.png") %>" alt="About Bharat Manav Kalyan Trust" />
                    </div>
                    <div class="about-accent-card">
                        <span class="accent-number">15+</span>
                        <span class="accent-text" data-hi="वर्षों की<br />समर्पित सेवा">Years of<br />Dedicated Service</span>
                    </div>
                </div>
                <div class="about-text animate-on-scroll">
                    <h3 data-hi="मानव कल्याण को समर्पित एक गैर-लाभकारी संस्था">A Non-Profit Dedicated to Human Welfare</h3>
                    <p data-hi="&lt;strong&gt;भारत मानव कल्याण ट्रस्ट&lt;/strong&gt; एक पंजीकृत गैर-लाभकारी संस्था (एनजीओ) है, जो पूरे भारत में वंचित समुदायों के उत्थान के लिए कार्य करती है। हम शिक्षा, स्वास्थ्य, महिला सशक्तिकरण, ग्रामीण विकास और समाज कल्याण पर ईमानदारी, पारदर्शिता और करुणा के साथ काम करते हैं।">
                        <strong>Bharat Manav Kalyan Trust</strong> is a registered non-profit organisation (NGO)
                        working across India for the upliftment of underprivileged communities. We focus on
                        education, healthcare, women empowerment, rural development, and social welfare with
                        honesty, transparency, and compassion.
                    </p>
                    <p data-hi="ज़मीनी स्तर के कार्यक्रमों और स्वयंसेवकों की मदद से हम उन बच्चों, परिवारों, बुज़ुर्गों और गाँवों तक पहुँचते हैं जिन्हें सबसे ज़्यादा ज़रूरत है। हमारा लक्ष्य सरल है — ऐसा स्थायी बदलाव लाना जिससे हर व्यक्ति सम्मान, अवसर और आशा के साथ जी सके।">
                        Through grassroots programs and volunteer-driven initiatives, we support children,
                        families, senior citizens, and villages that need care the most. Our aim is simple —
                        to create lasting change so every person can live with dignity, opportunity, and hope.
                    </p>
                    <div class="about-features">
                        <div class="feature-item">
                            <div class="feature-icon">🤝</div>
                            <div>
                                <strong data-hi="समुदाय सर्वोपरि">Community First</strong>
                                <p data-hi="स्थानीय विश्वास पर बने ज़मीनी कार्यक्रम">Grassroots programs built with local trust</p>
                            </div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">❤️</div>
                            <div>
                                <strong data-hi="कल्याण पर केंद्रित">Welfare Focus</strong>
                                <p data-hi="शिक्षा, स्वास्थ्य और आजीविका में सहयोग">Education, health and livelihood support</p>
                            </div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">🇮🇳</div>
                            <div>
                                <strong data-hi="सम्पूर्ण भारत में पहुँच">Pan-India Reach</strong>
                                <p data-hi="देशभर के समुदायों की सेवा में">Serving communities across the nation</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Mission Section -->
    <section class="section mission" id="mission">
        <div class="mission-bg-pattern"></div>
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="हमारा उद्देश्य">Our Mission</span>
                <h2 class="section-title" data-hi="बदलाव के तीन स्तंभ">Three Pillars of Change</h2>
                <div class="title-underline"></div>
                <p class="section-subtitle">सेवा &bull; समर्पण &bull; सशक्तिकरण</p>
            </div>
            <div class="mission-cards">
                <div class="mission-card animate-on-scroll" data-delay="0">
                    <div class="mission-card-inner">
                        <div class="mission-icon-wrap">
                            <span class="mission-icon">🤲</span>
                            <div class="mission-icon-ring"></div>
                        </div>
                        <h3>सेवा</h3>
                        <h4>Service</h4>
                        <p data-hi="बिना किसी भेदभाव के मानवता की निःस्वार्थ सेवा। हम उन तक पहुँचते हैं जहाँ कोई नहीं पहुँचता और उनकी सेवा करते हैं जिन्हें सबसे अधिक आवश्यकता है।">Selfless service to humanity without discrimination. We reach the unreached and serve those who need it most.</p>
                        <div class="mission-card-shine"></div>
                    </div>
                </div>
                <div class="mission-card animate-on-scroll" data-delay="150">
                    <div class="mission-card-inner">
                        <div class="mission-icon-wrap">
                            <span class="mission-icon">❤️</span>
                            <div class="mission-icon-ring"></div>
                        </div>
                        <h3>समर्पण</h3>
                        <h4>Dedication</h4>
                        <p data-hi="अपने ध्येय के प्रति पूर्ण समर्पण। हमारा हर स्वयंसेवक और सदस्य स्थायी बदलाव लाने के लिए पूरे मन से जुटा रहता है।">Complete dedication to our cause. Every volunteer and team member gives their heart to creating lasting change.</p>
                        <div class="mission-card-shine"></div>
                    </div>
                </div>
                <div class="mission-card animate-on-scroll" data-delay="300">
                    <div class="mission-card-inner">
                        <div class="mission-icon-wrap">
                            <span class="mission-icon">💪</span>
                            <div class="mission-icon-ring"></div>
                        </div>
                        <h3>सशक्तिकरण</h3>
                        <h4>Empowerment</h4>
                        <p data-hi="व्यक्तियों और समुदायों को कौशल, संसाधन और आत्मविश्वास देकर सक्षम बनाना, ताकि वे अपना भविष्य स्वयं गढ़ सकें।">Empowering individuals and communities with skills, resources, and confidence to build their own futures.</p>
                        <div class="mission-card-shine"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Programs Section -->
    <section class="section programs" id="programs">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="हमारा कार्य">Our Work</span>
                <h2 class="section-title" data-hi="कार्यक्रम एवं पहल">Programs &amp; Initiatives</h2>
                <div class="title-underline"></div>
            </div>
            <div class="programs-grid">
                <div class="program-card animate-on-scroll" data-delay="0">
                    <div class="program-card-front">
                        <span class="program-icon">📚</span>
                        <h3>Education for All</h3>
                        <p class="program-title-hi">सभी के लिए शिक्षा</p>
                    </div>
                    <p class="program-desc" data-hi="ग्रामीण भारत के वंचित बच्चों के लिए निःशुल्क शिक्षा, छात्रवृत्ति और डिजिटल साक्षरता कार्यक्रम।">Free schooling, scholarships, and digital literacy programs for underprivileged children across rural India.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="80">
                    <div class="program-card-front">
                        <span class="program-icon">🏥</span>
                        <h3>Healthcare Camps</h3>
                        <p class="program-title-hi">स्वास्थ्य शिविर</p>
                    </div>
                    <p class="program-desc" data-hi="दूरदराज़ के गाँवों में चलित स्वास्थ्य क्लिनिक, निःशुल्क चिकित्सा जाँच और दवा वितरण।">Mobile health clinics, free medical check-ups, and medicine distribution in remote villages.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="160">
                    <div class="program-card-front">
                        <span class="program-icon">👩‍💼</span>
                        <h3>Women Empowerment</h3>
                        <p class="program-title-hi">महिला सशक्तिकरण</p>
                    </div>
                    <p class="program-desc" data-hi="महिला उद्यमियों के लिए कौशल विकास, सूक्ष्म-वित्त सहायता और व्यावसायिक प्रशिक्षण।">Skill development, micro-finance support, and vocational training for women entrepreneurs.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="240">
                    <div class="program-card-front">
                        <span class="program-icon">🌱</span>
                        <h3>Rural Development</h3>
                        <p class="program-title-hi">ग्रामीण विकास</p>
                    </div>
                    <p class="program-desc" data-hi="स्वच्छ जल परियोजनाएँ, स्वच्छता अभियान और टिकाऊ कृषि से जुड़ी पहल।">Clean water projects, sanitation drives, and sustainable agriculture initiatives.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="320">
                    <div class="program-card-front">
                        <span class="program-icon">🍲</span>
                        <h3>Food Security</h3>
                        <p class="program-title-hi">खाद्य सुरक्षा</p>
                    </div>
                    <p class="program-desc" data-hi="सामुदायिक रसोई और पोषण कार्यक्रम, ताकि कोई भूखा न सोए।">Community kitchens and nutrition programs ensuring no one sleeps hungry.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="400">
                    <div class="program-card-front">
                        <span class="program-icon">🤝</span>
                        <h3>Disaster Relief</h3>
                        <p class="program-title-hi">आपदा राहत</p>
                    </div>
                    <p class="program-desc" data-hi="बाढ़, सूखा और प्राकृतिक आपदाओं के समय आपातकालीन सहायता पहुँचाने वाली त्वरित राहत टीमें।">Rapid response teams providing emergency aid during floods, droughts, and natural calamities.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card program-card--upcoming animate-on-scroll" data-delay="480">
                    <span class="program-badge" data-hi="आगामी">Upcoming</span>
                    <div class="program-card-front">
                        <span class="program-icon">🏡</span>
                        <h3>Old Age Homes</h3>
                        <p class="program-title-hi">वृद्धाश्रम</p>
                    </div>
                    <p class="program-desc" data-hi="वरिष्ठ नागरिकों के लिए सुरक्षित आश्रय, देखभाल और सम्मान — हमारे कल्याण कार्यक्रमों के अंतर्गत शीघ्र आरंभ।">Safe shelter, care, and dignity for senior citizens — coming soon under our welfare programs.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card program-card--upcoming animate-on-scroll" data-delay="560">
                    <span class="program-badge" data-hi="आगामी">Upcoming</span>
                    <div class="program-card-front">
                        <span class="program-icon">🧹</span>
                        <h3>Swachta Abhiyan</h3>
                        <p class="program-title-hi">स्वच्छता अभियान</p>
                    </div>
                    <p class="program-desc" data-hi="स्वस्थ गाँवों और शहरों के लिए सफ़ाई अभियान और जागरूकता कार्यक्रम — शीघ्र शुरू होंगे।">Cleanliness drives and awareness campaigns for healthier villages and cities — launching soon.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card program-card--upcoming animate-on-scroll" data-delay="640">
                    <span class="program-badge" data-hi="आगामी">Upcoming</span>
                    <div class="program-card-front">
                        <span class="program-icon">👁️</span>
                        <h3>Free Eye Camp</h3>
                        <p class="program-title-hi">निःशुल्क नेत्र शिविर</p>
                    </div>
                    <p class="program-desc" data-hi="वंचित समुदायों के लिए निःशुल्क नेत्र जाँच और उपचार सहायता — आगामी पहल।">Free eye check-ups and treatment support for underserved communities — upcoming initiative.</p>
                    <div class="program-card-bar"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Crowd Funding Section -->
    <section class="section crowdfunding" id="crowdfunding">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="एक नेक काम में सहयोग">Support a Cause</span>
                <h2 class="section-title" data-hi="क्राउड फंडिंग">Crowd Funding</h2>
                <div class="title-underline"></div>
            </div>
            <div class="info-panel animate-on-scroll">
                <h3 data-hi="दान करें। सहयोग दें। जीवन बदलें।">Donate. Support. Transform Lives.</h3>
                <p data-hi="क्राउड फंडिंग के ज़रिए दिया गया हर योगदान — चाहे छोटा हो या बड़ा — भारत मानव कल्याण ट्रस्ट के शिक्षा, स्वास्थ्य और समाज कल्याण कार्यक्रमों को चलाने में मदद करता है। ज़रूरतमंदों तक आशा पहुँचाने में हमारा साथ दें।">
                    Through crowd funding, every contribution — big or small — helps Bharat Manav Kalyan Trust
                    run education, healthcare, and community welfare programs. Join hands with us to bring hope
                    to those who need it most.
                </p>
                <p data-hi="आपके सहयोग से स्कूल की सामग्री, चिकित्सा शिविर, पोषण अभियान और वृद्धाश्रम, स्वच्छता अभियान एवं निःशुल्क नेत्र शिविर जैसी आगामी पहलों को बल मिलता है।">
                    Your support funds school supplies, medical camps, nutrition drives, and upcoming initiatives
                    like Old Age Homes, Swachta Abhiyan, and Free Eye Camps.
                </p>
                <a href="<%= ResolveUrl("~/Donate.aspx") %>" class="btn btn-primary" data-hi="अभी दान करें →">Donate Now →</a>
            </div>
        </div>
    </section>

    <!-- Impact Section -->
    <section class="section impact" id="impact">
        <div class="impact-bg">
            <div class="impact-overlay"></div>
        </div>
        <div class="container">
            <div class="section-header animate-on-scroll light">
                <span class="section-label" data-hi="हमारा प्रभाव">Our Impact</span>
                <h2 class="section-title" data-hi="बदलाव की ओर एक कदम">Making a Difference</h2>
                <div class="title-underline"></div>
            </div>
            <div class="stats-grid">
                <div class="stat-card animate-on-scroll" data-delay="0">
                    <div class="stat-number" data-target="50000">50,000+</div>
                    <div class="stat-label">Lives Touched</div>
                    <div class="stat-label-hi">जीवन प्रभावित</div>
                </div>
                <div class="stat-card animate-on-scroll" data-delay="100">
                    <div class="stat-number" data-target="120">120+</div>
                    <div class="stat-label">Villages Reached</div>
                    <div class="stat-label-hi">गाँव पहुँचे</div>
                </div>
                <div class="stat-card animate-on-scroll" data-delay="200">
                    <div class="stat-number" data-target="25">25+</div>
                    <div class="stat-label">Active Programs</div>
                    <div class="stat-label-hi">सक्रिय कार्यक्रम</div>
                </div>
                <div class="stat-card animate-on-scroll" data-delay="300">
                    <div class="stat-number" data-target="15">15+</div>
                    <div class="stat-label">Years of Service</div>
                    <div class="stat-label-hi">सेवा के वर्ष</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Gallery Section -->
    <section class="section gallery-home" id="gallery">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="गैलरी">Gallery</span>
                <h2 class="section-title" data-hi="तस्वीरों में हमारा कार्य">Our Work in Pictures</h2>
                <div class="title-underline"></div>
                <p class="section-subtitle gallery-subtitle">हमारे कार्य की झलकियाँ</p>
            </div>

            <div class="gallery-grid">
                <asp:Repeater ID="rptGallery" runat="server">
                    <ItemTemplate>
                        <article class="gallery-item animate-on-scroll" data-delay="<%# (Container.ItemIndex % 6) * 90 %>" data-gallery-index="<%# Container.ItemIndex %>">
                            <button type="button" class="gallery-card"
                                data-src="<%# ResolveUrl("~/" + Convert.ToString(Eval("ImagePath")).TrimStart('~','/')) %>"
                                data-title="<%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %>"
                                aria-label="View <%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %>">
                                <div class="gallery-card-media">
                                    <img src="<%# ResolveUrl("~/" + Convert.ToString(Eval("ImagePath")).TrimStart('~','/')) %>"
                                        alt="<%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %>" loading="lazy" />
                                    <div class="gallery-card-shade"></div>
                                </div>
                                <div class="gallery-card-body">
                                    <span class="gallery-card-index"><%# (Container.ItemIndex + 1).ToString("00") %></span>
                                    <h4 class="gallery-item-title"><%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %></h4>
                                    <span class="gallery-card-action"><span class="gallery-action-icon">+</span> <span data-hi="देखें">View</span></span>
                                </div>
                            </button>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="gallery-view-all animate-on-scroll">
                <a href="<%= ResolveUrl("~/Gallery.aspx") %>" class="btn btn-primary" data-hi="सभी देखें">View All</a>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="section faq" id="faq">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="सामान्य प्रश्न">FAQs</span>
                <h2 class="section-title" data-hi="अक्सर पूछे जाने वाले प्रश्न">Frequently Asked Questions</h2>
                <div class="title-underline"></div>
                <p class="section-subtitle faq-subtitle">आपके प्रश्न, हमारे उत्तर</p>
            </div>
            <div class="faq-layout">
                <div class="faq-intro animate-on-scroll">
                    <div class="faq-image-wrapper">
                        <img src="<%= ResolveUrl("~/site/assets/images/faq_image.png") %>" alt="FAQ Support" class="faq-main-img" />
                    </div>
                    <div class="faq-intro-card">
                        <h3 data-hi="अब भी कोई प्रश्न है?">Still have questions?</h3>
                        <p data-hi="जो खोज रहे थे वह नहीं मिला? हमें सहायता करने में ख़ुशी होगी — कभी भी संपर्क करें।">Couldn't find what you were looking for? We're happy to help - reach out anytime.</p>
                        <a href="#contact" class="btn btn-primary faq-intro-btn" data-hi="सीधे हमसे पूछें">Ask Us Directly</a>
                    </div>
                </div>
                <div class="faq-list" id="faqList">
                    <div class="faq-item animate-on-scroll open" data-delay="0">
                        <button class="faq-question" type="button" aria-expanded="true">
                            <span class="faq-q-text">
                                <span class="faq-q-en">What is Bharat Manav Kalyan Trust?</span>
                                <span class="faq-q-hi">भारत मानव कल्याण ट्रस्ट क्या है?</span>
                            </span>
                            <span class="faq-toggle" aria-hidden="true">
                                <span class="faq-toggle-icon"></span>
                            </span>
                        </button>
                        <div class="faq-answer">
                            <div class="faq-answer-inner">
                                <p data-hi="हम एक पंजीकृत गैर-लाभकारी ट्रस्ट हैं जो शिक्षा, स्वास्थ्य, महिला सशक्तिकरण और ग्रामीण विकास के माध्यम से पूरे भारत में मानव कल्याण के लिए कार्य करता है &#8212; हमारे स्तंभ हैं सेवा, समर्पण और सशक्तिकरण।">We are a registered non-profit trust working for human welfare across India through education, healthcare, women empowerment, and rural development &#8212; guided by our pillars of सेवा, समर्पण, and सशक्तिकरण.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item animate-on-scroll" data-delay="60">
                        <button class="faq-question" type="button" aria-expanded="false">
                            <span class="faq-q-text">
                                <span class="faq-q-en">How can I donate or support the Trust?</span>
                                <span class="faq-q-hi">कैसे सहायता कर सकते हैं?</span>
                            </span>
                            <span class="faq-toggle" aria-hidden="true">
                                <span class="faq-toggle-icon"></span>
                            </span>
                        </button>
                        <div class="faq-answer">
                            <div class="faq-answer-inner">
                                <p data-hi="आप आर्थिक दान, वस्तु-रूप में सहयोग, या किसी विशेष कार्यक्रम को प्रायोजित करके हमारी मदद कर सकते हैं। संपर्क फ़ॉर्म भरें या हमें कॉल करें &#8212; हम आपको सबसे सुरक्षित और पारदर्शी विकल्प बताएँगे।">You can support us through monetary donations, in-kind contributions, or by sponsoring a specific program. Reach out via the contact form or call us &#8212; we will guide you with the safest and most transparent options.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item animate-on-scroll" data-delay="120">
                        <button class="faq-question" type="button" aria-expanded="false">
                            <span class="faq-q-text">
                                <span class="faq-q-en">Can I volunteer with your programs?</span>
                                <span class="faq-q-hi">क्या मैं स्वयंसेवक बन सकता हूँ?</span>
                            </span>
                            <span class="faq-toggle" aria-hidden="true">
                                <span class="faq-toggle-icon"></span>
                            </span>
                        </button>
                        <div class="faq-answer">
                            <div class="faq-answer-inner">
                                <p data-hi="जी हाँ! हम शिक्षकों, चिकित्सकों, कुशल पेशेवरों और सेवा भाव रखने वाले हर व्यक्ति का स्वागत करते हैं। संपर्क अनुभाग के माध्यम से अपनी रुचि बताएँ, हमारी टीम उपलब्ध अवसरों के साथ आपसे संपर्क करेगी।">Yes! We welcome teachers, doctors, skilled professionals, and anyone with a will to serve. Share your interest through the Contact section and our team will get in touch with available opportunities.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item animate-on-scroll" data-delay="180">
                        <button class="faq-question" type="button" aria-expanded="false">
                            <span class="faq-q-text">
                                <span class="faq-q-en">Where do you currently work?</span>
                                <span class="faq-q-hi">आप कहाँ काम करते हैं?</span>
                            </span>
                            <span class="faq-toggle" aria-hidden="true">
                                <span class="faq-toggle-icon"></span>
                            </span>
                        </button>
                        <div class="faq-answer">
                            <div class="faq-answer-inner">
                                <p data-hi="हमारे कार्यक्रम इस समय भारत के 120+ गाँवों तक पहुँच रहे हैं, जिनमें वंचित ग्रामीण समुदायों पर विशेष ध्यान है। जहाँ शिक्षा, स्वास्थ्य और सशक्तिकरण की सबसे अधिक आवश्यकता है, वहाँ हम निरंतर विस्तार कर रहे हैं।">Our programs currently reach 120+ villages across India, with a focus on underserved rural communities. We continue expanding where the need for education, healthcare, and empowerment is greatest.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item animate-on-scroll" data-delay="240">
                        <button class="faq-question" type="button" aria-expanded="false">
                            <span class="faq-q-text">
                                <span class="faq-q-en">How is donation money used?</span>
                                <span class="faq-q-hi">दान की राशि कैसे उपयोग होती है?</span>
                            </span>
                            <span class="faq-toggle" aria-hidden="true">
                                <span class="faq-toggle-icon"></span>
                            </span>
                        </button>
                        <div class="faq-answer">
                            <div class="faq-answer-inner">
                                <p data-hi="हर योगदान का अधिकतम हिस्सा सीधे ज़मीनी कार्यक्रमों में लगता है &#8212; स्कूल, स्वास्थ्य शिविर, कौशल प्रशिक्षण और राहत कार्य। हम पारदर्शी रिकॉर्ड रखते हैं और अपने सहयोगियों के साथ प्रभाव की जानकारी साझा करते हैं।">A maximum share of every contribution goes directly to field programs &#8212; schools, health camps, skill training, and relief work. We maintain transparent records and can share impact updates with our supporters.</p>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item animate-on-scroll" data-delay="300">
                        <button class="faq-question" type="button" aria-expanded="false">
                            <span class="faq-q-text">
                                <span class="faq-q-en">Is the Trust officially registered?</span>
                                <span class="faq-q-hi">क्या ट्रस्ट पंजीकृत है?</span>
                            </span>
                            <span class="faq-toggle" aria-hidden="true">
                                <span class="faq-toggle-icon"></span>
                            </span>
                        </button>
                        <div class="faq-answer">
                            <div class="faq-answer-inner">
                                <p data-hi="जी हाँ। भारत मानव कल्याण ट्रस्ट एक पंजीकृत गैर-लाभकारी संस्था है, जो पूरे भारत में वैध, नैतिक और जवाबदेह समाजसेवा के लिए प्रतिबद्ध है।">Yes. Bharat Manav Kalyan Trust is a registered non-profit organization committed to lawful, ethical, and accountable social service across Bharat.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="section contact" id="contact">
        <div class="contact-bg-pattern"></div>
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="संपर्क में रहें">Get In Touch</span>
                <h2 class="section-title" data-hi="संपर्क करें">Contact Us</h2>
                <div class="title-underline"></div>
                <p class="section-subtitle contact-subtitle">हमसे जुड़ें &#8212; आपकी आवाज़, हमारी प्राथमिकता</p>
            </div>

            <div class="contact-layout">
                <div class="contact-visual animate-on-scroll">
                    <div class="contact-image-card">
                        <img src="<%= ResolveUrl("~/site/assets/images/contact_image.png") %>" alt="Contact our team" class="contact-image" />
                        <div class="contact-image-overlay">
                            <span class="contact-image-badge" data-hi="हम आपकी सहायता के लिए हैं">We're Here to Help</span>
                            <p data-hi="दान, स्वयंसेवा, साझेदारी या हमारे कार्य से जुड़े किसी भी प्रश्न के लिए हमसे संपर्क करें।">Reach out for donations, volunteering, partnerships, or any questions about our work.</p>
                        </div>
                    </div>

                    <div class="contact-cards">
                        <div class="contact-card">
                            <div class="contact-card-icon">📍</div>
                            <div>
                                <strong data-hi="हमसे मिलें">Visit Us</strong>
                                <p><asp:Literal ID="litContactAddress" runat="server" Text="New Delhi, India"></asp:Literal></p>
                            </div>
                        </div>
                        <div class="contact-card">
                            <div class="contact-card-icon">📞</div>
                            <div>
                                <strong data-hi="हमें कॉल करें">Call Us</strong>
                                <p><asp:HyperLink ID="hypContactPhone" runat="server" NavigateUrl="tel:+919876543210"><asp:Literal ID="litContactPhone" runat="server" Text="+91 98765 43210"></asp:Literal></asp:HyperLink></p>
                            </div>
                        </div>
                        <div class="contact-card">
                            <div class="contact-card-icon">✉️</div>
                            <div>
                                <strong data-hi="हमें ईमेल करें">Email Us</strong>
                                <p><asp:HyperLink ID="hypContactEmail" runat="server" NavigateUrl="mailto:info@bharatmanavkalyantrust.org"><asp:Literal ID="litContactEmail" runat="server" Text="info@bharatmanavkalyantrust.org"></asp:Literal></asp:HyperLink></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact-form-panel animate-on-scroll">
                    <div class="contact-form-header">
                        <h3 data-hi="संदेश भेजें">Send a Message</h3>
                        <p data-hi="फ़ॉर्म भरें, हमारी टीम 24&#8211;48 घंटों में आपसे संपर्क करेगी।">Fill out the form and our team will respond within 24&#8211;48 hours.</p>
                    </div>

                    <asp:Panel ID="pnlContactSuccess" runat="server" Visible="false" CssClass="contact-alert contact-alert-success">
                        <asp:Literal ID="litContactSuccess" runat="server" Text="Thank you! Your message has been received."></asp:Literal>
                    </asp:Panel>
                    <asp:Panel ID="pnlContactError" runat="server" Visible="false" CssClass="contact-alert contact-alert-error">
                        <asp:Literal ID="litContactError" runat="server"></asp:Literal>
                    </asp:Panel>

                    <div class="contact-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="<%= txtName.ClientID %>" data-hi="पूरा नाम *">Full Name *</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="" placeholder="Your name" data-hi-placeholder="आपका नाम"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="<%= txtEmail.ClientID %>" data-hi="ईमेल *">Email *</label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="your@email.com" data-hi-placeholder="your@email.com"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="<%= txtPhone.ClientID %>" data-hi="फ़ोन नंबर">Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" placeholder="+91 XXXXX XXXXX" data-hi-placeholder="+91 XXXXX XXXXX"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="<%= txtSubject.ClientID %>" data-hi="विषय">Subject</label>
                                <asp:TextBox ID="txtSubject" runat="server" placeholder="How can we help?" data-hi-placeholder="हम आपकी क्या मदद कर सकते हैं?"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtMessage.ClientID %>" data-hi="संदेश *">Message *</label>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" placeholder="Write your message here..." data-hi-placeholder="अपना संदेश यहाँ लिखें..."></asp:TextBox>
                        </div>
                        <asp:LinkButton ID="btnSendMessage" runat="server" CssClass="btn btn-primary btn-full" OnClick="btnSendMessage_Click">
                            <span data-hi="संदेश भेजें">Send Message</span>
                            <span class="btn-arrow">→</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        (function () {
            var root = document.getElementById('heroBgSlider');
            if (!root) return;
            var slides = root.querySelectorAll('.hero-slide');
            if (!slides.length) return;
            root.classList.add('has-slides');
            if (slides.length < 2) return;
            var i = 0;
            setInterval(function () {
                slides[i].classList.remove('is-active');
                i = (i + 1) % slides.length;
                slides[i].classList.add('is-active');
            }, 5000);
        })();
    </script>

</asp:Content>

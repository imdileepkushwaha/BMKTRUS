<%@ Page Title="Bharat Manav Kalyan Trust &#8212; Service &bull; Dedication &bull; Empowerment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="IndexPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="hero-bg">
            <div class="hero-particles" id="particles"></div>
            <div class="hero-gradient"></div>
        </div>
        <div class="container hero-container">
            <div class="hero-content">
                <div class="hero-badge animate-fade-up" data-delay="0">
                    <span class="badge-dot"></span>
                    Serving Humanity Since 2010
                </div>
                <h1 class="hero-title animate-fade-up" data-delay="100">
                    <span class="title-hindi"><asp:Literal ID="litHeroHi" runat="server" Text="भारत मानव कल्याण ट्रस्ट"></asp:Literal></span>
                    <span class="title-en"><asp:Literal ID="litHeroEn" runat="server" Text="Bharat Manav Kalyan Trust"></asp:Literal></span>
                </h1>
                <p class="hero-tagline animate-fade-up" data-delay="200">
                    <asp:Literal ID="litHeroTagline" runat="server" Text="सेवा • समर्पण • सशक्तिकरण"></asp:Literal>
                </p>
                <p class="hero-desc animate-fade-up" data-delay="300">
                    Rooted in the strength of the Banyan tree and guided by the light of knowledge,
                    we work tirelessly to uplift communities across Bharat.
                </p>
                <div class="hero-buttons animate-fade-up" data-delay="400">
                    <a href="#programs" class="btn btn-primary">Our Programs</a>
                    <a href="<%= ResolveUrl("~/Register.aspx") %>" class="btn btn-outline">Sign Up</a>
                    <a href="<%= ResolveUrl("~/user/index.aspx") %>" class="btn btn-outline">Member Login</a>
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
                <span class="scroll-text">Scroll Down</span>
                <span class="scroll-arrow"></span>
            </a>
        </div>
    </section>

    <!-- About Section -->
    <section class="section about" id="about">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label">About Us</span>
                <h2 class="section-title">Who We Are</h2>
                <div class="title-underline"></div>
            </div>
            <div class="about-grid">
                <div class="about-image animate-on-scroll">
                    <div class="about-img-frame">
                        <img src="<%= ResolveUrl("~/site/assets/images/ngo_image.png") %>" alt="About Bharat Manav Kalyan Trust" />
                    </div>
                    <div class="about-accent-card">
                        <span class="accent-number">15+</span>
                        <span class="accent-text">Years of<br />Dedicated Service</span>
                    </div>
                </div>
                <div class="about-text animate-on-scroll">
                    <h3>Building a Stronger, Kinder India</h3>
                    <p>
                        <strong>Bharat Manav Kalyan Trust</strong> is a registered non-profit trust committed to
                        human welfare across India. Like the mighty Banyan tree in our emblem &#8212; deep-rooted,
                        far-reaching, and sheltering &#8212; we nurture communities with care and compassion.
                    </p>
                    <p>
                        Our symbol carries profound meaning: the map of India on the tree trunk reflects our
                        nationwide commitment; the open book and Ashoka Lion represent knowledge and national
                        pride; the blessing hand and rising sun signify hope and protection for all.
                    </p>
                    <div class="about-features">
                        <div class="feature-item">
                            <div class="feature-icon">🌳</div>
                            <div>
                                <strong>Deep Roots</strong>
                                <p>Community-driven programs built on trust</p>
                            </div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">☀️</div>
                            <div>
                                <strong>Hope &amp; Light</strong>
                                <p>Bringing opportunity to every corner</p>
                            </div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">📖</div>
                            <div>
                                <strong>Knowledge First</strong>
                                <p>Education as the foundation of change</p>
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
                <span class="section-label">Our Mission</span>
                <h2 class="section-title">Three Pillars of Change</h2>
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
                        <p>Selfless service to humanity without discrimination. We reach the unreached and serve those who need it most.</p>
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
                        <p>Complete dedication to our cause. Every volunteer and team member gives their heart to creating lasting change.</p>
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
                        <p>Empowering individuals and communities with skills, resources, and confidence to build their own futures.</p>
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
                <span class="section-label">Our Work</span>
                <h2 class="section-title">Programs &amp; Initiatives</h2>
                <div class="title-underline"></div>
            </div>
            <div class="programs-grid">
                <div class="program-card animate-on-scroll" data-delay="0">
                    <div class="program-card-front">
                        <span class="program-icon">📚</span>
                        <h3>Education for All</h3>
                        <p class="program-title-hi">सभी के लिए शिक्षा</p>
                    </div>
                    <p class="program-desc">Free schooling, scholarships, and digital literacy programs for underprivileged children across rural India.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="80">
                    <div class="program-card-front">
                        <span class="program-icon">🏥</span>
                        <h3>Healthcare Camps</h3>
                        <p class="program-title-hi">स्वास्थ्य शिविर</p>
                    </div>
                    <p class="program-desc">Mobile health clinics, free medical check-ups, and medicine distribution in remote villages.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="160">
                    <div class="program-card-front">
                        <span class="program-icon">👩‍💼</span>
                        <h3>Women Empowerment</h3>
                        <p class="program-title-hi">महिला सशक्तिकरण</p>
                    </div>
                    <p class="program-desc">Skill development, micro-finance support, and vocational training for women entrepreneurs.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="240">
                    <div class="program-card-front">
                        <span class="program-icon">🌱</span>
                        <h3>Rural Development</h3>
                        <p class="program-title-hi">ग्रामीण विकास</p>
                    </div>
                    <p class="program-desc">Clean water projects, sanitation drives, and sustainable agriculture initiatives.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="320">
                    <div class="program-card-front">
                        <span class="program-icon">🍲</span>
                        <h3>Food Security</h3>
                        <p class="program-title-hi">खाद्य सुरक्षा</p>
                    </div>
                    <p class="program-desc">Community kitchens and nutrition programs ensuring no one sleeps hungry.</p>
                    <div class="program-card-bar"></div>
                </div>
                <div class="program-card animate-on-scroll" data-delay="400">
                    <div class="program-card-front">
                        <span class="program-icon">🤝</span>
                        <h3>Disaster Relief</h3>
                        <p class="program-title-hi">आपदा राहत</p>
                    </div>
                    <p class="program-desc">Rapid response teams providing emergency aid during floods, droughts, and natural calamities.</p>
                    <div class="program-card-bar"></div>
                </div>
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
                <span class="section-label">Our Impact</span>
                <h2 class="section-title">Making a Difference</h2>
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
                <span class="section-label">Gallery</span>
                <h2 class="section-title">Our Work in Pictures</h2>
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
                                    <span class="gallery-card-action"><span class="gallery-action-icon">+</span> View</span>
                                </div>
                            </button>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="section faq" id="faq">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label">FAQs</span>
                <h2 class="section-title">Frequently Asked Questions</h2>
                <div class="title-underline"></div>
                <p class="section-subtitle faq-subtitle">आपके प्रश्न, हमारे उत्तर</p>
            </div>
            <div class="faq-layout">
                <div class="faq-intro animate-on-scroll">
                    <div class="faq-image-wrapper">
                        <img src="<%= ResolveUrl("~/site/assets/images/faq_image.png") %>" alt="FAQ Support" class="faq-main-img" />
                    </div>
                    <div class="faq-intro-card">
                        <h3>Still have questions?</h3>
                        <p>Couldn't find what you were looking for? We're happy to help - reach out anytime.</p>
                        <a href="#contact" class="btn btn-primary faq-intro-btn">Ask Us Directly</a>
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
                                <p>We are a registered non-profit trust working for human welfare across India through education, healthcare, women empowerment, and rural development &#8212; guided by our pillars of सेवा, समर्पण, and सशक्तिकरण.</p>
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
                                <p>You can support us through monetary donations, in-kind contributions, or by sponsoring a specific program. Reach out via the contact form or call us &#8212; we will guide you with the safest and most transparent options.</p>
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
                                <p>Yes! We welcome teachers, doctors, skilled professionals, and anyone with a will to serve. Share your interest through the Contact section and our team will get in touch with available opportunities.</p>
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
                                <p>Our programs currently reach 120+ villages across India, with a focus on underserved rural communities. We continue expanding where the need for education, healthcare, and empowerment is greatest.</p>
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
                                <p>A maximum share of every contribution goes directly to field programs &#8212; schools, health camps, skill training, and relief work. We maintain transparent records and can share impact updates with our supporters.</p>
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
                                <p>Yes. Bharat Manav Kalyan Trust is a registered non-profit organization committed to lawful, ethical, and accountable social service across Bharat.</p>
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
                <span class="section-label">Get In Touch</span>
                <h2 class="section-title">Contact Us</h2>
                <div class="title-underline"></div>
                <p class="section-subtitle contact-subtitle">हमसे जुड़ें &#8212; आपकी आवाज़, हमारी प्राथमिकता</p>
            </div>

            <div class="contact-layout">
                <div class="contact-visual animate-on-scroll">
                    <div class="contact-image-card">
                        <img src="<%= ResolveUrl("~/site/assets/images/contact_image.png") %>" alt="Contact our team" class="contact-image" />
                        <div class="contact-image-overlay">
                            <span class="contact-image-badge">We're Here to Help</span>
                            <p>Reach out for donations, volunteering, partnerships, or any questions about our work.</p>
                        </div>
                    </div>

                    <div class="contact-cards">
                        <div class="contact-card">
                            <div class="contact-card-icon">📍</div>
                            <div>
                                <strong>Visit Us</strong>
                                <p><asp:Literal ID="litContactAddress" runat="server" Text="New Delhi, India"></asp:Literal></p>
                            </div>
                        </div>
                        <div class="contact-card">
                            <div class="contact-card-icon">📞</div>
                            <div>
                                <strong>Call Us</strong>
                                <p><asp:HyperLink ID="hypContactPhone" runat="server" NavigateUrl="tel:+919876543210"><asp:Literal ID="litContactPhone" runat="server" Text="+91 98765 43210"></asp:Literal></asp:HyperLink></p>
                            </div>
                        </div>
                        <div class="contact-card">
                            <div class="contact-card-icon">✉️</div>
                            <div>
                                <strong>Email Us</strong>
                                <p><asp:HyperLink ID="hypContactEmail" runat="server" NavigateUrl="mailto:info@bharatmanavkalyantrust.org"><asp:Literal ID="litContactEmail" runat="server" Text="info@bharatmanavkalyantrust.org"></asp:Literal></asp:HyperLink></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="contact-form-panel animate-on-scroll">
                    <div class="contact-form-header">
                        <h3>Send a Message</h3>
                        <p>Fill out the form and our team will respond within 24&#8211;48 hours.</p>
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
                                <label for="<%= txtName.ClientID %>">Full Name *</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="" placeholder="Your name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="<%= txtEmail.ClientID %>">Email *</label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="your@email.com"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="<%= txtPhone.ClientID %>">Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" placeholder="+91 XXXXX XXXXX"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="<%= txtSubject.ClientID %>">Subject</label>
                                <asp:TextBox ID="txtSubject" runat="server" placeholder="How can we help?"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtMessage.ClientID %>">Message *</label>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" placeholder="Write your message here..."></asp:TextBox>
                        </div>
                        <asp:LinkButton ID="btnSendMessage" runat="server" CssClass="btn btn-primary btn-full" OnClick="btnSendMessage_Click">
                            <span>Send Message</span>
                            <span class="btn-arrow">→</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

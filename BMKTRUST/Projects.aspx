<%@ Page Title="Projects &#8212; Bharat Manav Kalyan Trust" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="ProjectsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-shell {
            padding: 48px 0 72px;
            background: linear-gradient(180deg, #F7F9FC 0%, #EEF2F7 100%);
        }

        .page-shell .info-panel { margin-top: 8px; }

        .project-topics {
            display: grid;
            gap: 28px;
            margin: 28px 0 8px;
        }

        .project-topic {
            display: grid;
            grid-template-columns: minmax(0, 1.05fr) minmax(0, 0.95fr);
            gap: 0;
            align-items: stretch;
            border-radius: 18px;
            overflow: hidden;
            background: #fff;
            border: 1px solid rgba(0, 43, 92, 0.1);
            box-shadow: 0 14px 36px rgba(0, 26, 58, 0.08);
        }

        .project-topic.reverse {
            grid-template-columns: minmax(0, 0.95fr) minmax(0, 1.05fr);
        }

        .project-topic.reverse .project-topic-media { order: 2; }
        .project-topic.reverse .project-topic-body { order: 1; }

        .project-topic-media {
            position: relative;
            min-height: 280px;
            background: #0b1a2e;
            overflow: hidden;
        }

        .project-topic-media img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center;
            transition: transform 0.45s ease;
        }

        .project-topic:hover .project-topic-media img {
            transform: scale(1.04);
        }

        .project-topic-media::after {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, transparent 55%, rgba(0, 26, 58, 0.35));
            pointer-events: none;
        }

        .project-topic-body {
            padding: 28px 28px 26px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background:
                linear-gradient(135deg, rgba(232, 197, 71, 0.08) 0%, transparent 42%),
                linear-gradient(180deg, #fff 0%, #FBF9F4 100%);
        }

        .project-topic-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            align-self: flex-start;
            margin-bottom: 12px;
            padding: 5px 12px;
            border-radius: 999px;
            background: linear-gradient(135deg, #001A3A, #003D7A);
            color: #E8C547;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
        }

        .project-topic-tag-dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: #E8C547;
            box-shadow: 0 0 0 3px rgba(232, 197, 71, 0.25);
        }

        .project-topic-body h3 {
            margin: 0 0 8px;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: clamp(1.35rem, 2.4vw, 1.7rem);
            font-weight: 700;
            color: #001A3A;
            line-height: 1.25;
        }

        .project-topic-hi {
            margin: 0 0 14px;
            font-family: "Noto Sans Devanagari", "Source Sans 3", sans-serif;
            font-size: 1.05rem;
            font-weight: 700;
            color: #5A4508;
            line-height: 1.4;
        }

        .project-topic-body p {
            margin: 0;
            color: #3A4A5A;
            line-height: 1.7;
            font-size: 0.95rem;
        }

        .project-topic-points {
            list-style: none;
            margin: 16px 0 0;
            padding: 0;
            display: grid;
            gap: 8px;
        }

        .project-topic-points li {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            font-size: 0.9rem;
            font-weight: 600;
            color: #002B5C;
            line-height: 1.45;
        }

        .project-topic-points li::before {
            content: "";
            width: 8px;
            height: 8px;
            min-width: 8px;
            margin-top: 7px;
            border-radius: 50%;
            background: linear-gradient(135deg, #C9A227, #E8C547);
            box-shadow: 0 0 0 3px rgba(201, 162, 39, 0.18);
        }

        @media (max-width: 860px) {
            .project-topic,
            .project-topic.reverse {
                grid-template-columns: 1fr;
            }

            .project-topic.reverse .project-topic-media,
            .project-topic.reverse .project-topic-body {
                order: initial;
            }

            .project-topic-media {
                min-height: 220px;
                aspect-ratio: 16 / 10;
            }

            .project-topic-body {
                padding: 22px 20px 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-shell">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="हमारे प्रोजेक्ट्स">Our Projects</span>
                <h2 class="section-title" data-hi="प्रोजेक्ट्स">Projects</h2>
                <div class="title-underline"></div>
            </div>

            <div class="info-panel animate-on-scroll">
                <h3 data-hi="समाज के उत्थान के लिए हमारे प्रमुख प्रोजेक्ट्स">Key Projects for Community Upliftment</h3>
                <p data-hi="भारत मानव कल्याण ट्रस्ट युवाओं को कौशल और रोज़गार के अवसर देने तथा जरूरतमंद परिवारों की कन्यादान में सहायता करने जैसे प्रोजेक्ट्स के माध्यम से समाज में स्थायी बदलाव लाने के लिए कार्यरत है।">
                    Bharat Manav Kalyan Trust works to create lasting change through projects that give youth skills and livelihood opportunities, and support families in need with Kanyadaan assistance.
                </p>
            </div>

            <div class="project-topics">
                <!-- Youth Employment Training -->
                <article class="project-topic animate-on-scroll">
                    <div class="project-topic-media">
                        <img src="<%= ResolveUrl("~/site/assets/images/projects/youth-training.jpg") %>"
                             alt="Youth employment and skills training"
                             loading="lazy" />
                    </div>
                    <div class="project-topic-body">
                        <span class="project-topic-tag">
                            <span class="project-topic-tag-dot" aria-hidden="true"></span>
                            <span data-hi="प्रोजेक्ट 01">Project 01</span>
                        </span>
                        <h3 data-hi="युवक-युवतियों को रोज़गार प्रशिक्षण">Youth Employment Training</h3>
                        <p class="project-topic-hi">युवक-युवतियों को रोज़गार प्रशिक्षण</p>
                        <p data-hi="हम युवाओं को कौशल विकास, व्यावसायिक प्रशिक्षण और रोज़गार से जोड़ने वाले कार्यक्रम चलाते हैं, ताकि वे आत्मनिर्भर बन सकें और अपने परिवार व समाज का सहारा बन सकें।">
                            We run skill-development and vocational training programs that connect young men and women with livelihood opportunities, so they can become self-reliant and support their families and communities.
                        </p>
                        <ul class="project-topic-points">
                            <li data-hi="कौशल विकास एवं व्यावसायिक प्रशिक्षण">Skill development &amp; vocational training</li>
                            <li data-hi="रोज़गार और आजीविका के अवसर">Employment &amp; livelihood opportunities</li>
                            <li data-hi="युवाओं का सशक्तिकरण और आत्मनिर्भरता">Youth empowerment &amp; self-reliance</li>
                        </ul>
                    </div>
                </article>

                <!-- Kanyadaan Support -->
                <article class="project-topic reverse animate-on-scroll">
                    <div class="project-topic-media">
                        <img src="<%= ResolveUrl("~/site/assets/images/projects/kanyadaan.jpg") %>"
                             alt="Kanyadaan support for needy families"
                             loading="lazy" />
                    </div>
                    <div class="project-topic-body">
                        <span class="project-topic-tag">
                            <span class="project-topic-tag-dot" aria-hidden="true"></span>
                            <span data-hi="प्रोजेक्ट 02">Project 02</span>
                        </span>
                        <h3 data-hi="कन्यादान में मदद करना">Kanyadaan Support</h3>
                        <p class="project-topic-hi">कन्यादान में मदद करना</p>
                        <p data-hi="आर्थिक रूप से कमज़ोर परिवारों की बेटियों के विवाह में हम सम्मानपूर्वक सहयोग करते हैं — ताकि हर कन्यादान गरिमा, सहयोग और सामुदायिक सेवा की भावना के साथ संपन्न हो सके।">
                            We respectfully support the marriage of daughters from economically weaker families — so every Kanyadaan can be completed with dignity, care, and the spirit of community service.
                        </p>
                        <ul class="project-topic-points">
                            <li data-hi="जरूरतमंद परिवारों को आर्थिक सहयोग">Financial support for needy families</li>
                            <li data-hi="सम्मानजनक और सुरक्षित विवाह व्यवस्था में सहायता">Help for dignified &amp; safe wedding arrangements</li>
                            <li data-hi="सामुदायिक सहयोग और सामाजिक कल्याण">Community support &amp; social welfare</li>
                        </ul>
                    </div>
                </article>
            </div>

            <div class="info-panel animate-on-scroll" style="margin-top:28px;">
                <p style="margin-bottom:0;" data-hi="इन प्रोजेक्ट्स में सहयोग देना चाहते हैं? दान करें या हमसे संपर्क करें — हर योगदान किसी जीवन को बदलने में मदद करता है।">
                    Want to support these projects? Donate or contact us — every contribution helps change a life.
                </p>
                <p style="margin-top:18px;">
                    <a href="<%= ResolveUrl("~/Donate.aspx") %>" class="btn btn-primary" data-hi="हमारे कार्य में सहयोग करें →">Support Our Work →</a>
                    <a href="<%= ResolveUrl("~/index.aspx") %>#contact" class="btn btn-outline-dark" style="margin-left:8px;" data-hi="संपर्क करें">Contact Us</a>
                </p>
            </div>
        </div>
    </section>
</asp:Content>

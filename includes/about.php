<section id="about" class="about animate-on-scroll">
        <h4 class="about__title animate-on-scroll">Who We Are</h4>

        <div class="about__header animate-on-scroll">
            <div class="about__intro">
                <h2 class="about__headline">
                    <span class="accent-color">Crafting Excellence</span><br>in Every Project
                </h2>
                <p class="about__subtitle">
                    We Have Years Of Experience In Providing Quality Building Services
                </p>
            </div>

            <div class="about__cta">
                <button type="button" class="btn btn-primary">Contact Us</button>
            </div>
        </div>

        <div class="about__content animate-on-scroll">
            <div class="about__image-wrapper">
                <img src="assets/images/nabstar-construction-6.jpg" alt="Construction Team at Work" class="about__image">
                <p class="about__experience">
                    <strong>10+</strong><span><strong>Years</strong><br> of Experience</span>
                </p>
            </div>

            <div class="about__mission animate-on-scroll">
                <div class="degradation"></div>
                <h5 class="about__mission-title">
                    <span class="accent-color">Our Mission</span>
                </h5>
                <p class="about__mission-text">
                    Here at Nabstar Construction, our Watford-based team truly cares about making our customers happy and takes immense pride in our work. We always go the extra mile to deliver great, reliable results.
                </p>
            </div>
        </div>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Animation du bouton
            const ctaButton = document.querySelector('.about__cta .btn');
            ctaButton.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-3px)';
                this.style.boxShadow = '0 10px 20px rgba(0, 0, 0, 0.15)';
            });

            ctaButton.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = '0 5px 15px rgba(0, 0, 0, 0.1)';
            });
        });
    </script>
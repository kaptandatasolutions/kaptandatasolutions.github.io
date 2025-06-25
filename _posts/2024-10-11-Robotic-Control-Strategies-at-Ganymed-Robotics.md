---
layout: post
title: Robotic Control Strategies at Ganymed Robotics - MATLAB EXPO Paris 2024
subtitle: Innovating Orthopedic Surgery with Collaborative Surgical Robots
cover-img: /assets/img/blog_image-gany-robo-cover.png
thumbnail-img: /assets/img/blog_image-gany-robo-1.png
share-img: /assets/img/blog_image-gany-robo-1.png
tags: [robotics, orthopedic-surgery, medical-devices, innovation, MATLAB, Simulink, quality-control]
author: Kayhan Kaptan - Expert in radiotherapy quality control, data science and automation
---

# FAQ: Robotic Control Strategies at Ganymed Robotics

Ganymed Robotics stands at the forefront of innovation in orthopedic surgery, developing a collaborative surgical robot to assist surgeons in knee replacement procedures. With the rising demand for these surgeries, the company strives to address clinical needs while adhering to the strict regulatory requirements of medical devices. This blog highlights Ganymed’s robotic control strategies, their collaboration with MathWorks, and the key stages in their technological development.

## 1. What clinical need is Ganymed Robotics addressing?

Ganymed Robotics is developing a robot to assist surgeons in total knee replacement, a common surgery used to treat osteoarthritis. In the U.S., the demand for this procedure is rapidly increasing, with an expected 2.3 million annual surgeries by 2030, up from 1.2 million in 2019. This growth reflects the rising number of osteoarthritis patients, necessitating an innovative and reliable solution.

## 2. How are MATLAB and Simulink used in the development of Ganymed Robotics' surgical robot?

Ganymed Robotics utilizes **MATLAB** and **Simulink** to model the robot's actuators, simulate control loops, and test results on a bench before integration into the embedded application. These tools enable the modeling of non-standard components, virtual model control simulation, and the generation of optimized **C** code for production.

## 3. How does Ganymed Robotics ensure its robot meets regulatory requirements?

Ganymed Robotics follows a rigorous development process, compliant with regulatory standards, including **FDA 21 CFR Part 11**. The **V-model** development cycle ensures that every phase—from modeling to final validation—meets safety and efficiency standards. Continuous documentation and testing throughout the process are essential to achieve the certifications required for a medical device.

## 4. Can you provide a concrete example of a control function implemented in the robot?

A notable example is the brake phase management, a critical function for precise control of the robot’s movement during surgery. The controller defines braking phases based on the robot’s position and brake status, ensuring smooth and safe surgical operations.

## 5. How is the modeling of non-standard components like an electromagnetic brake performed?

The modeling of a non-standard component, such as an **electromagnetic brake**, is achieved through a multi-physics approach. Three models are combined to simulate the brake’s behavior: an electrical model to simulate current in the coil, an electromechanical model to calculate braking force, and a mechanical model accounting for the robot's inertia and applied torque. This allows for seamless and accurate integration of the component into the overall system.

## 6. What types of testing are conducted to validate the robot's control strategies?

Ganymed conducts rigorous testing at multiple levels. **Bench tests** are used to verify control loop performance in a controlled environment. Next, **integration tests on the robot** ensure the system functions properly in real-world conditions, validating the effectiveness of the implemented control strategies.

## 7. What are the benefits of using MATLAB and Simulink for the robot’s development?

The adoption of MATLAB and Simulink allowed Ganymed to transition from a **proof of concept (POC)** to industrial-grade, modular, and extensible code. This process accelerated development and enhanced the testability and efficiency of control loops. Moreover, the partnership with MathWorks enabled the Ganymed team to acquire new skills, optimizing their workflow.

## 8. What are the next development steps for Ganymed Robotics?

Looking forward, Ganymed Robotics plans to refine its robotic model using **Simscape Multibody** to simulate more accurate mechanical behaviors. Additionally, they aim to integrate their test bench into the Simulink environment to better correlate virtual simulations with physical testing.

---

## Key Milestones

- **Late 2019**: Demonstration of a control proof of concept using Arduino and a commercial driver.
- **Early 2020**: Start of modeling and simulations using MATLAB Simulink.
- **Mid 2020**: First test bench to verify simulation results.
- **Late 2020**: Initial control loops integrated into the embedded code.
- **2024**: Industrialization of test benches and continuous integration of models into GitLab.

---

## Conclusion: A Promising Future for Surgical Robotics

Through a close collaboration with **MathWorks**, Ganymed Robotics has developed a high-performance surgical robot that complies with the stringent regulatory requirements of the medical sector. This success is rooted in the use of MATLAB and Simulink for modeling, simulation, and code generation, paving the way for more precise and safer robots. The next steps will further refine these systems to meet the growing needs of orthopedic surgery.

> **Next Step:** Integrate Simscape Multibody tools and test benches into Simulink to optimize simulation-test correlation.

---

This article is based on insights shared by **Margot Guillouard** and **Blaise Bleunven** at MATLAB EXPO 2024.


🎧 **Listen to the podcast now:**

<audio controls style="width: 100%; max-width: 600px;">
  <source src="/podcast_kds/Ganymed Robotics.wav" type="audio/wav">
  Your browser does not support the audio element.
</audio>

---

![PNG](/assets/img/blog_image-robotics.png)

---

📥 **Podcast Transcription**

---

All right. So, you know, everyone's always going on about robots taking over the world. Well, seems like you were way ahead of the curve, you know, with all your interest in Ganymede robotics. Let's dive into this whole world of robots doing knee surgery of all things.

Yeah. And it's not some far off sci-fi thing either. Like the actual need for knee replacements is going to skyrocket by 2030. Think about this. The U.S. alone will need to be doing twice as many surgeries as we do right now.

Twice. So we're talking, what, two million every year?

Two million a year. It's crazy.

Okay. Yeah. I see why you sent this my way. That's a huge number. But hold on. Can't surgeons already handle like all those surgeries? What's the big advantage of bringing robots into the operating room?

Well, think about it. Traditional knee replacements, they work, but they're tough on people. Recovery, it takes a while. And even the best surgeon, they can't be totally, absolutely precise every single time, right? And that's where this robotics thing comes in. It's all about upping that accuracy, making those surgeries super efficient, and hopefully people recover faster, get better outcomes overall.

You know what, now that you mention it, I do remember my grandma's knee replacement. It was a pretty rough recovery, that's for sure. So Ganymede, they're developing robots just for these kinds of surgeries.

They are. They've got this surgical robot and get this, it actually works with the surgeon right there in the moment. Makes the whole thing smoother, more precise. And here's the kicker, it's designed to be compact, more affordable too. That's huge for hospitals.

We're talking collaborative robots in the operating room. It's like something out of the future, but in a good way. Right. But how do you even begin to design something that complex? I mean, where do you even start?

This is where it gets really cool. They use this software, MATLAB and Simulink, and it's like super key because it lets them build the whole robot virtually, test it out before even touching a single physical piece.

Hold on. So are we talking like those crazy realistic video games? They're practicing on virtual knees with a robot that's not even real?

You got it. That's a great way to think about it. It lets them perfect every little movement, every control, catch any hiccups before they even build anything. And in medicine, that's everything, right? Because safety is like the biggest deal. They have to hit the highest possible standard. It's called 21 CFR Part 11 compliance, if you want the technical term.

Okay, that 21 CFR Part 11 compliance. That's the FDA making sure this robot is as safe as humanly possible, right?

Exactly. It's like the gold standard for software and medical devices. Super strict rules, you know. But let's bring it down. So imagine you have to program this robot to move really precisely, stopping on a dime during surgery.

Otherwise, we've got a runaway robot scalpel on our hands. Not good.

Right. That's where one of many control functions comes in. It's called break phase management, and it basically ensures all those movements are smooth, controlled, and most importantly, they stop exactly when they should.

Okay, that makes me feel a lot better. But I gotta ask, a robot with brakes, how does that even work?

Well, they went all out and actually designed this electromagnetic brake, totally custom. To do that, they used something called a multi-physics approach.

Sounds complicated.

Well, kind of. Basically, they have to think about all these different parts of physics working together at the same time. Imagine, like baking a cake, right? You need that perfect balance of ingredients so it rises just right. Except here, the ingredients are electricity, magnetism, and actual mechanics, and they all have to work together to create the perfect braking force.

So they had to make sure the electrical current, the magnets, and the whole physical braking thing all worked together perfectly.

Exactly. And they had to model every single step in detail. First, they simulated how the electricity flows through the brake to make that magnetic field. Then they modeled how that magnetic field, along with friction, actually stops the robot. It's kind of mind-blowing how much detail they had to work with.

Okay, so we've got this incredibly intricate robot, custom-made brakes, software that's gone through the FDA ringer. But how do they know it actually works in the real world? That's what I want to know.

That's where Ganymed really sets themselves apart.

Because, like, anybody can cobble a robot together, but making sure it can actually do what it's supposed to. You know, especially in surgery, that's got to be the tricky part, right?

You got it. They don't just stay in the virtual world. They bring it into the real one.

So less virtual knee and more like robot surgery boot camp.

Something like that. They have these like specialized test benches and they basically put the robot and all its software through the ringer. It's the robot's final exam before it gets anywhere near an operating room.

OK, so paint me a picture. They've got this robot up on a table and they're making it do a bunch of knee surgeries on what crash test dummies or something?

Not crash test dummies exactly, but you're on the right track. They set up these super controlled scenarios that are basically like real surgeries. They push that robot to its limits, see how it handles the pressure.

Makes sense. Going to make sure it can think on its feet or wheels or whatever. But how do they connect what they're seeing on these test benches back to, you know, that MATLAB and Simulink stuff, those virtual models?

That's the really cool part. The code they make and refine in that virtual MATLAB and Simulink world, they actually upload it straight to the physical robot for the test.

Wait, really? It's that direct? From computer to robot? Just like that?

That's the power of these tools. And what it means for Ganymede is they get to see exactly how their code, you know, the stuff designed in that perfect virtual world, how it actually behaves in the real world with all its messiness. And they can use that feedback to make their models even better. So it's like this tight loop between the virtual and the real.

A constant back and forth. The models make the real thing better, which makes the models even better and so on.

Exactly. That's how they've been able to make so much progress so fast. I mean, think about it. It's only been a few years and look where they are. It's amazing.

It really is. You know, with all this talk about robots doing surgery, is there any part of you that's a little, I don't know, weirded out? Like, are we one step closer to robots taking over everything?

I get where you're coming from, but honestly, what Ganymede is doing is pretty inspiring. They're taking this technology and they're solving a real problem, something that could help millions of people facing knee surgery. To me, that's the opposite of something to be worried about.

Yeah, it's easy to get caught up in the sci-fi of it all, but really it's about helping people.

Exactly. And the way Ganymed goes about it, you know, all that care and precision, it makes me really optimistic about what's possible in medicine.

Okay, so we've got this virtual design, this super rigorous testing, but this is just the beginning for Ganymed, right? They're not going to stop at knee surgery.

Right. Really good when it comes to this tech. What's next for them? How do they want to push the boundaries of robot surgery even further? So before we got sidetracked with the whole robot uprising thing, you're about to tell me about Ganymede's next big thing. Simscape Multibody, was it? It sounds a little intense, even for them.

It's pretty wild. Remember how we were talking about those crazy, detailed virtual models they build of the robots? Simscape Multibody takes that to a whole other level. It's like... Imagine being able to take into account how flexible the materials are, the exact shape of every single part, even those tiny little interactions between different components and all of that in the virtual world.

So they're basically going from a model to like a digital twin, an exact replicate down to the tiniest detail.

Exactly. And having all that detail, it means those simulations are even more accurate. They can predict how the robot's going to behave in even crazier situations and make those movements even more precise, which at the end of the day, means even better safety protocols.

Because the more they know about how it's gonna act virtually, the better prepared it is for an actual operating room, like giving the surgical team that extra bit of confidence.

Exactly, but here's the really exciting part. Ganymed's not just stopping at improving those virtual models, they're finding even more ways to tie those models to real-world testing.

You're talking about those test benches again, right? What are they doing? Plugging the robot into the matrix or something?

Not quite. Although that would be pretty cool. But get this. They're working on a way to directly integrate those test benches into the Simulink environment.

Hold on. So they'll be able to control the actual physical robot, run tests on it, all from inside that virtual Simulink space.

Yep. It's a total game changer. They'll be able to jump back and forth between virtual testing and the real deal all in one place. And the best part, it allows for something called correlation. Basically, they can run a test virtually, then run that same exact test on the physical

 robot and compare the two results.


**[[See the website of Ganymedrobotics]](https://www.ganymedrobotics.com/)** 

[![png](/assets/img/blog_image-gany-robo-1.png)](https://www.ganymedrobotics.com/)

---


<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kaptan Data Solutions</title>
    <style>
        .citation {
            background-color: #f3e8ff;
            border-left: 4px solid #8b5cf6;
            padding: 20px;
            margin: 20px 0;
            border-radius: 8px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
        }
        .citation h3 {
            color: #6b21a8;
            margin-top: 0;
        }
        .citation a {
            color: #7c3aed;
            text-decoration: none;
        }
        .citation a:hover {
            text-decoration: underline;
        }
        .expertise-list {
            margin: 15px 0;
        }
        .hashtags {
            font-weight: bold;
            color: #7c3aed;
            margin-top: 15px;
        }
    </style>
</head>
<body>
  <div class="citation">
    <h3>🔍 Discover Kaptan Data Solutions — your partner for medical-physics data science & QA!</h3>

    <p>We're a French startup dedicated to building innovative web applications for <strong>medical physics, and quality assurance (QA)</strong>.</p>

    <p>Our mission: provide hospitals, cancer centers and dosimetry labs with powerful, intuitive and compliant tools that streamline beam-data acquisition, analysis and reporting.</p>

    <p>
      <a href="https://kaptandatasolutions.github.io/">🌐 Explore all our medical-physics services and tech updates</a><br>
      <a href="https://kaptan-data.streamlit.app/">💻 Test our ready-to-use QA dashboards online</a>
    </p>

    <p><strong>Our expertise covers:</strong></p>
    <div class="expertise-list">
      📊 Interactive dashboards for linac performance & trend analysis<br>
      🔬 Patient-specific dosimetry and image QA (EPID, portal dosimetry)<br>
      📈 Statistical Process Control (SPC) & anomaly detection for beam data<br>
      🤖 Automated QA workflows with n8n + AI agents (predictive maintenance)<br>
      📑 DICOM-RT / HL7 compliant reporting and audit trails
    </div>

    <p>Leveraging advanced Python analytics and n8n orchestration, we help physicists automate routine QA, detect drifts early and generate regulatory-ready PDFs in one click.</p>

    <p>Ready to boost treatment quality and uptime? Let’s discuss your linac challenges and design a tailor-made solution!</p>

    <div class="hashtags">
      #MedicalPhysics #Radiotherapy #LinacQA #DICOM #DataScience #Automation
    </div>

    <p><a href="https://kaptandatasolutions.github.io/submit-project/">Request a quote</a></p>
  </div>
</body>
</html>
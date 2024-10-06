---
layout: post
title: Automated SPC Web Solution for Quality Control in Radiotherapy
subtitle: Real-time Data Monitoring and Reporting, Accessible Across Your Center’s Network with a Demo Available on Our Portfolio
cover-img: /assets/img/blog_image-image-gen-cover-1.png
thumbnail-img: /assets/img/blog_image-image-gen-cover.png
share-img: /assets/img/blog_image-image-gen-cover-3.png
tags: [data-science, medical-physics, software, solutions, spc, statistical process control, Automated SPC]
author: Kayhan Kaptan (Assistant physicist and data analyst)
---

# Simulate Medical Imaging for Quality Control with Customizable DICOM Test Images

In the field of medical physics, ensuring precise and reliable imaging systems is crucial for effective treatment and diagnostics. With the rise of digital technologies, the ability to simulate medical imaging systems and generate customized DICOM test images has become an invaluable tool. Whether you're testing quality control measures or evaluating imaging tools, generating your own test images can streamline processes and enhance accuracy.

At **Kaptan Data Solutions**, we're leveraging the power of open-source libraries like **Pylinac** to offer an innovative solution that allows users to simulate and customize imaging system tests. Pylinac's flexible image generation capabilities make it easy to create tailored test images for your specific needs, whether you're working with standard imaging systems like **AS1200**, **AS1000**, or **AS500**, or creating fully customized scenarios.

Explore more about Pylinac's capabilities through their official [documentation](https://pylinac.readthedocs.io/en/latest/image_generator.html#).

## Generate Your Own DICOM Test Images

With this simulation tool, you can generate **DICOM test images** that mimic the acquisition conditions of real systems, helping you assess quality control tools or perform personal measurements. This user-friendly application simplifies complex image generation processes, providing immediate visual feedback and in-depth customization.

Here’s a look at the key features:

### 1. Imaging System Selection
Users can select from popular imaging systems like the **AS1200**, **AS1000**, or **AS500**, with each system offering unique characteristics and image acquisition capabilities. This step allows you to simulate the exact conditions you would experience in real-world scenarios.

### 2. Predefined and Custom Test Models
Once the imaging system is chosen, users can select a test model from predefined templates such as:
- **Simple Open Field**
- **Offset Field**
- **Winston-Lutz**
- **VMAT with Multiple Fields**
- **Picket Fence**
- **Starshot**

For those needing a completely personalized test, the **Custom Model** option allows full control over the parameters.

![DICOM test images](/assets/img/Capture_image_gen-1.png)

> The image shows the level of customization of the DICOM image that can be generated with such a tool.


### 3. Full Parameter Customization
The customization of parameters is where this tool truly shines. Using interactive sliders, users can adjust specific aspects of the image simulation, such as:

- **Field Dimensions:** Adjust the height and width of the field from **10 to 300 mm**.
- **Gaussian Filter Sigma:** Fine-tune the sigma value of the Gaussian filter for different effects.
- **Noise Parameters:** Control noise levels by setting the mean and standard deviation.
- **Special Parameters:** Specific to tests like **Winston-Lutz**, where you can adjust **Cone Size** and **BB Size**.

These options make it easy to replicate various imaging conditions and test their effects on your quality assurance processes.


### 4. Real-Time Visualization
As you tweak the parameters, the system provides real-time visual feedback. The generated image dynamically updates to reflect the changes, allowing you to fine-tune the simulation to perfection.


### 5. Adding DICOM Metadata
In addition to generating the image, the tool also allows you to embed specific **DICOM metadata**. This can include acquisition details, system specifications, and other relevant medical data, making it easy to integrate these simulated images into existing workflows for further analysis.

### 6. Export and Download Your Results
Once satisfied with the configuration, you can export the generated images in various formats, including **DICOM**. These files can be downloaded for later use, making it easy to revisit or share results with colleagues for further analysis.

**[[See the demo on our website]](https://www.assistant-physicien.fr/image_generator)** 

[![png](/assets/img/image_gen.png)](https://www.assistant-physicien.fr/image_generator)

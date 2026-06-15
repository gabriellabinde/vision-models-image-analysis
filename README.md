# vision-models-image-analysis
Image analysis and retrieval using Gabor filters, Fourier transforms, and log-polar descriptors in MATLAB.

# Vision Models – Image Analysis and Retrieval

This repository contains a series of image processing and computer vision experiments developed in MATLAB as part of a Cognitive Sciences Master's course.

The project explores how visual information can be represented and compared using frequency-domain analysis, texture descriptors, and biologically inspired filtering techniques.

## Overview

The implemented pipeline investigates:

* Texture analysis using Gabor filters
* Frequency-domain image representation using the Fourier Transform
* Spectral preprocessing techniques
* Rotation and scale effects on image descriptors
* Log-polar image representations
* Content-based image retrieval and image indexing

## Main Concepts

### Gabor Filters

Gabor filters were used to analyze image textures and orientation information. Different filter parameters were explored to understand how orientation selectivity affects visual feature extraction.

### Fourier Analysis

Two-dimensional Fourier transforms were applied to visualize image frequency content and study how image structure is represented in the spectral domain.

### Spectral Preprocessing

Several preprocessing techniques were evaluated, including:

* Mean removal
* Hanning windowing

These steps help reduce luminance bias and border artifacts before spectral analysis.

### Invariant Image Representations

The project investigates how image descriptors behave under:

* Rotation
* Scaling
* Translation

Log-polar sampling was used to generate more compact and transformation-tolerant representations.

### Image Retrieval

Different image indexing approaches were compared in order to evaluate their ability to retrieve visually similar images.

Methods explored include:

* Histogram-based indexing
* Gabor-based descriptors
* Spectral descriptors

## Repository Structure

```text
code/
├── main_image_analysis.m
└── image_retrieval_query.m

report/
└── TP_Vision_Models_Report.pdf
```

## Skills Demonstrated

* MATLAB programming
* Digital image processing
* Fourier analysis
* Texture analysis
* Feature extraction
* Computer vision fundamentals
* Experimental data analysis
* Scientific reporting

## Academic Context

This project was developed during the Master's program in Cognitive Sciences at Université Grenoble Alpes.

The implementation follows concepts introduced during coursework and includes independent experimentation, analysis, and interpretation of results.

## Author

Gabriella Binde

MSc Cognitive Sciences
Université Grenoble Alpes | Grenoble INP - Phelma

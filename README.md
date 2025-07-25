# Neurochemical markers of uncertainty processing in humans
This repository contains Rmd analysis scripts for the project **"Neurochemical markers of uncertainty processing in humans"** and Matlab Psychtoolbox scripts for implementation of the probabilistic serial reaction time task (SRT). 

Details can be found in the following preprint:
> Neurochemical markers of uncertainty processing in humans
Nazia Jassim, Peter Thestrup Waade, Owen Parsons, Frederike H Petzschner, Caterina Rua, Christopher T Rodgers, Simon Baron-Cohen, John Suckling, Christoph Mathys, Rebecca P Lawson. bioRxiv 2025.02.19.639013; doi: [https://doi.org/10.1101/2025.02.19.639013](https://doi.org/10.1101/2025.02.19.639013)


**Probabilistic Serial Reaction Time Task (SRT) MATLAB Script**

Script Name: serialReactionTimeTask.m
Purpose: Implements the probabilistic Serial Reaction Time (SRT) task with pre-generated sequences, using Psychtoolbox for stimulus presentation and response collection.

Overview
This script runs Session 1 of a probabilistic SRT task.Participants respond to visual cues ("X" appearing in one of four boxes) by pressing the corresponding key (z, x, n, m). The trial order is initially randomized within blocks but follows a fixed probabilistic sequence (Kaufmann et al., 2010). Session 2 (reversal learning) must be run using the separate Session 2 script.

Main Features
Pre-generated sequence: Uses session1_seq_generation.csv to ensure identical trial sequences across participants.
Task structure: 8 blocks × 120 trials each, with 30-second breaks between blocks.
Feedback: Beep sound on incorrect or delayed responses.

Data logging: Saves responses, RTs, and sequence info to Results/serialReactionTimeTask-[timestamp]-participant-[ID].txt.

Practice trials: Includes a short training demo before the main task.

Requirements
MATLAB (R2017+ recommended)
Psychtoolbox-3 (added to MATLAB path)
Audio enabled for feedback beeps

Files required in the same folder:
session1_seq_generation.csv (fixed sequence file)

** Behavioural data RmD analysis script **
This script performs data preparation, cleaning, modeling, and visualization for behavioural data from a probabilistic serial reaction time (SRT) task. The workflow includes:

Data import and preprocessing – Loading demographics and SRT task data, filtering practice trials, and handling missing or outlier responses.

Data preparation for modeling – Creating log-transformed reaction times, coding post-error trials, and saving a clean dataset for hierarchical Gaussian filter (HGF) modeling.

Model-free analyses – Generating summary statistics, accuracy rates, and performing t-tests across sessions.

Linear mixed-effects models (LME) – Assessing effects of stimulus sequence, session (pre- vs. post-reversal), trial stages (early, middle, late), and post-error effects on reaction times.

Visualization – Creating publication-quality plots of sequence effects, stage effects, and post-error dynamics using ggplot2 and related libraries.

Summary metrics – Computing mean and median reaction times, log reaction times, and accuracy per participant, per session, and by trial type.

Dependencies
The analysis requires the following R packages:
tidyverse, naniar, ggpubr, lmerTest, ggdist, ggrain, gghalves.

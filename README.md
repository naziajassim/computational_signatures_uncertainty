# Neurochemical markers of uncertainty processing in humans
This repository contains Rmd analysis scripts for the project **"Neurochemical markers of uncertainty processing in humans"** and Matlab Psychtoolbox scripts for implementation of the probabilistic serial reaction time task (SRT). 

Details can be found in the following preprint:
> Neurochemical markers of uncertainty processing in humans
Nazia Jassim, Peter Thestrup Waade, Owen Parsons, Frederike H Petzschner, Caterina Rua, Christopher T Rodgers, Simon Baron-Cohen, John Suckling, Christoph Mathys, Rebecca P Lawson. bioRxiv 2025.02.19.639013; doi: [https://doi.org/10.1101/2025.02.19.639013](https://doi.org/10.1101/2025.02.19.639013)


**Probabilistic Serial Reaction Time Task (SRT) MATLAB Script**

_Script Name: serialReactionTimeTask.m_.

_Purpose: Implements the probabilistic Serial Reaction Time (SRT) task with pre-generated sequences, using Psychtoolbox for stimulus presentation and response collection._

* Overview: This script runs Session 1 of a probabilistic SRT task.Participants respond to visual cues ("X" appearing in one of four boxes) by pressing the corresponding key (z, x, n, m). The trial order is initially randomized within blocks but follows a fixed probabilistic sequence (Kaufmann et al., 2010). Session 2 (reversal learning) must be run using the separate Session 2 script.

* Main Features: 
Pre-generated sequence: Uses session1_seq_generation.csv to ensure identical trial sequences across participants.
Task structure: 8 blocks × 120 trials each, with 30-second breaks between blocks.
Feedback: Beep sound on incorrect or delayed responses.

* Data logging: Saves responses, RTs, and sequence info to Results/serialReactionTimeTask-[timestamp]-participant-[ID].txt.

* Practice trials: Includes a short training demo before the main task.

Requirements:  MATLAB (R2017+ recommended), Psychtoolbox-3 (added to MATLAB path), Audio enabled for feedback beeps

**Behavioural data RmD analysis script**

_Script name: behavioural_analyses_srt.Rmd_

_Purpose: Performs data preparation, cleaning, modeling, and visualization for behavioural data from a probabilistic serial reaction time (SRT) task._ 

The workflow includes:

* Data import and preprocessing: Loading demographics and SRT task data, filtering practice trials, and handling missing or outlier responses.

* Data preparation for modeling: Creating log-transformed reaction times, coding post-error trials, and saving a clean dataset for hierarchical Gaussian filter (HGF) modeling.

* Model-free analyses: Generating summary statistics, accuracy rates, and performing t-tests across sessions.

* Linear mixed-effects models (LME):  Assessing effects of stimulus sequence, session (pre- vs. post-reversal), trial stages (early, middle, late), and post-error effects on reaction times.

* Visualization: Creating publication-quality plots of sequence effects, stage effects, and post-error dynamics using ggplot2 and related libraries.

* Summary metrics: Computing mean and median reaction times, log reaction times, and accuracy per participant, per session, and by trial type.

R packages required: tidyverse, naniar, ggpubr, lmerTest, ggdist, ggrain, gghalves

**Post hoc analyses on HGF modelling output**

_Script name: hgf_posthoc_analyses.Rmd_

_Purpose: Conducts post hoc analyses on Hierarchical Gaussian Filter (HGF) modeling outputs to examine relationships between model-derived uncertainty parameters, neurochemical markers from MRS, and questionnaire data._

The workflow includes:

* Data import: Loading HGF model output CSV files (hgf_posteriors_all_participants.csv, hgf_results_all.csv), behavioral histories, demographics (demographics_srt.csv), and MRS glutamate+glutamine (Glx) data (glx_motor.csv).

* Data processing: Filtering and renaming regression beta parameters reflecting unexpected uncertainty, expected uncertainty, post-error slowing, and post-reversal effects for each participant.

* Visualization: Generating summary plots of parameter estimates with confidence intervals, ranking participants by effect sizes.

* Statistical analyses: Correlating post-reversal beta parameters with trait anxiety (STAI-Trait) scores, examining associations between HGF parameters and motor cortex Glx levels.

* Additional exploratory analyses: Visualization of regression noise parameter relationships with questionnaire measures.

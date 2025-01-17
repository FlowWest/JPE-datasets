Feather River Carcass Survey QC
================
Erin Cain
9/29/2021

# Feather River Carcass Survey QC

## Description of Monitoring Data

The feather river carcass survey was provided to us in two sets of
access databases:

1.  Historical data was provided in a “Escapement DBs FlowWest.zip” that
    contains:

-   **Carcass 2000.mdb**

    (Identified tables of interest)

    -   ChopEnvTBL (ChopEnvID, Week’s Tag Color, Date, Time Start, Time
        Stop, Crew, Recorder, Turbidity, Bottle Number, Weather Code,
        Comments, Week)
    -   ChopRecovTBL (Section Unit, \# of Adult Males Chopped, \# of
        Adult Females Chopped, \# of Grisle Males Chopped,\# of Grilse
        Females Chopped, Number Spawned, RecovID, Chop Env ID)
    -   cwtTBL (Auto Fish ID, Date, Section, Unit, FL, Sex, Eggs, Head
        Tag Number, CWT Code)
    -   RecovTagTBL (RecovID, Tag Number, RecovTagID, RelStat,
        MultRecov)
    -   TagEnvTBL (Date, Recorder’s Initials, Week’s Tag Color,
        TagEnvID, Week)

-   **Carcass 2001.mdb**

    -   ChopEnvTBL (ChopEnvID, Date, Time, Crew, Recorder, TagCol, Flow,
        Vis, Weather, Comment, WeekNum)
    -   ChopRecovTBL (Sect, Chan, Minute, Male, Fem, Gril, RecovID,
        ChopEnvID)
    -   cwtTBL (cwtID, Date, Sect, FL, Sex, HTNum, EggRet, Comment)
    -   TagEnvTBL (Date, Crew, TagCol, Recorder, Flow, WeekNum,
        TagEnvID)

-   **Carcass 2002.mdb**

    -   Even more tables in this one…

-   **Carcass 2003\_converted.accdb**, **Carcass 2004.mdb** (consistant
    tables for these two years)

    -   ChopChannelTBL (ChanID, Sect, Chan, Min, Male, Fem, Gril,
        TagCount, HeaderID)
    -   ChopHeaderTBL (headerID, TagCol, Date, Crew, Time, Recorder,
        Weather, Comment, WeekNum)
    -   ChopRecovTBL (RecovID, RecovColor, RecovCount, ChanID)
    -   CWTHeaderTBL (headerID, Date, TagCol, Crew, WeekNum)
    -   CWTTagTBL (TagID, Sect, RelLoc, FL, Sex, Spawn, Clip, SampType,
        CarcStat SampNum, HeadTag, Comment, HeaderID)

-   **Carcass 2005.mdb**

    -   2005 chops (headerID, TagCol, Date, WeekNum, Sect, ChopClip,
        ChopNClip, ChopUncheck, TagClip, TagNClip, TagUnk)
    -   2005\_carcass (ID, HallPrint1, HallPrint2, Date, Sex, Spawn,
        TagID)
    -   2005\_recaps (ID, Date, Fate, Location, Released, FishID,
        FishID2, Field7, Field8, Field9, F10)
    -   ChopChannelTBL1 (ChanID, Sect, Chan, Min, Male, Fem, Gril,
        TagCount, ChopClip, ChopNClip, ChopUncheck, TagClip, TagNClip,
        TagUnk, HeaderID)
    -   ChopHeaderTBL (headerID, TagCol, Date, Crew, Time, Recorder,
        Weather, Comment, WeekNum)
    -   ChopRecovTBL (RecovID, RecovColor, RecovCount, ChanID)
    -   CWTHeaderTBL (headerID, Date, TagCol, Crew, WeekNum)
    -   CWTTagTBL (TagID, Sect, RelLoc, FL, Sex, Spawn, Clip, SampType,
        CarcStat SampNum, HeadTag, Comment, HeaderID, HallPrint1,
        HallPrint2)

-   **Carcass 2006.mdb**

    -   ChopChannelTBL1 (ChanID, Sect, Chan, Min, ChopClip, ChopNClip,
        ChopUncheck, TagClip, TagNClip, TagUnk, HeaderID)
    -   ChopHeaderTBL (headerID, TagCol, Date, Crew, Time, Recorder,
        Weather, Comment, WeekNum)
    -   ChopRecovTBL (RecovID, RecovColor, RecovCount, ChanID)
    -   CWTHeaderTBL (headerID, Date, TagCol, Crew, WeekNum)
    -   CWTTagTBL (TagID, Sect, RelLoc, FL, Sex, Spawn, Clip, SampType,
        CarcStat SampNum, HeadTag, Comment, HeaderID, HallPrint1,
        HallPrint2)

-   **Carcass 2007.mdb**

    -   ChopChannelTBL1 (ChanID, Sect, Chan, Min, ChopClip, ChopNClip,
        ChopUncheck, TagClip, TagNClip, TagUnk, HeaderID)
    -   ChopHallprintTBL (TagID, Sect, Sex, Spawn, Clip, HeadTag, FL,
        CarcStat, HeaderID, HallPrint1, HallPrint2, Comment)
    -   ChopHeaderTBL (headerID, TagCol, Date, Crew, Time, Recorder,
        Weather, Comment, WeekNum)
    -   ChopRecovTBL (RecovID, RecovColor, RecovCount, ChanID)
    -   CWTHeaderTBL (headerID, Date, TagCol, Crew, WeekNum)
    -   CWTTagTBL (TagID, Sect, RelLoc, FL, Sex, Spawn, Clip, SampType,
        CarcStat SampNum, HeadTag, Comment, HeaderID, HallPrint1,
        HallPrint2)

-   **Carcass 2008.mdb**

    -   ChopChannelTBL1 (ChanID, Sect, Chan, Min, HeaderID, Chops, Tags)
    -   ChopHallprintTBL(TagID, Sect, Sex, Clip, HeadTag, FL, CarcStat,
        HeaderID, HallPrint1, HallPrint2, Otolith\#, Scale)
    -   ChopHeaderTBL (headerID, TagCol, Date, Crew, Time, Recorder,
        Weather, Comment, WeekNum)

-   **Carcass 2009.mdb**

-   **Carcass 2010.mdb**

-   **FINAL Carcass 20011.mdb**

-   **FINAL Carcass 20013.mdb**

-   **FINAL Carcass 20014.accdb**

-   **FINAL Carcass 20015.accdb**

-   **FINAL Carcass 20016.accdb**

Each databse contains a lot of tables describing carcass surveys on the
feather including: carcassSurvey, carcassChops, carcassIndividual…ect

2.  Recent data in the CAMP carcass database was sent in a “CAMP DB for
    FlowWest.zip” that contains:

-   CAMP\_Escapement\_20210412mdb
-   CAMP\_EscapementEntry.mdb
-   CAMP\_EscapementEntry\_Backup.mdb

**Timeframe:**

**Video Season:**

**Completeness of Record throughout timeframe:**

**Sampling Location:**

**Data Contact:**

Any additional info?

## Access Cloud Data

``` r
# Run Sys.setenv() to specify GCS_AUTH_FILE and GCS_DEFAULT_BUCKET before running 
# getwd() to see how to specify paths 
# Open object from google cloud storage
# Set your authentication using gcs_auth
gcs_auth(json_file = Sys.getenv("GCS_AUTH_FILE"))
# Set global bucket 
gcs_global_bucket(bucket = Sys.getenv("GCS_DEFAULT_BUCKET"))

# git data and save as xlsx
```

Read in data from google cloud, glimpse raw data and domain description
sheet:

``` r
# read in data to clean 
```

## Data transformations

``` r
# For different excel sheets for each year read in and combine years here
```

``` r
# Snake case, 
# Columns are appropriate types
# Remove redundant columns
```

## Explore Numeric Variables:

``` r
# Filter clean data to show only numeric variables 
```

### Variable: `[name]`

**Plotting \[Variable\] over Period of Record**

``` r
# Make whatever plot is appropriate 
# maybe 2+ plots are appropriate
```

**Numeric Summary of \[Variable\] over Period of Record**

``` r
# Table with summary statistics
```

**NA and Unknown Values**

Provide a stat on NA or unknown values

## Explore Categorical variables:

General notes: If there is an opportunity to turn yes no into boolean do
so, but not if you loose value

``` r
# Filter clean data to show only categorical variables
```

### Variable: `[name]`

``` r
#table() 
```

Fix inconsistencies with spelling, capitalization, and abbreviations.

``` r
# Fix any inconsistencies with categorical variables
```

**Create lookup rda for \[variable\] encoding:**

``` r
# Create named lookup vector
# Name rda [watershed]_[data type]_[variable_name].rda
# save rda to data/ 
```

**NA and Unknown Values**

Provide a stat on NA or unknown values

## Summary of identified issues

-   List things that are funcky/bothering us but that we don’t feel like
    should be changed without more investigation

## Save cleaned data back to google cloud

``` r
# Write to google cloud 
# Name file [watershed]_[data type].csv
```

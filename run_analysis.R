# Note that the original source data from the UC Irvine Machine Learning 
# repository was extracted and made available in the "UCI-HAR-Dataset" folder.

library(dplyr)

################################################################################
##                                                                            ##
## Loads the reference data that is required at a later stage by the          ##
## objectives specified by the exercise.                                      ##
##                                                                            ##
################################################################################

# Loads the descriptive names for the activities
activities <- read.table("UCI-HAR-Dataset/activity_labels.txt")
names(activities) <- c("class_label", "activity_name")

# Loads the descriptive names for the data features. These will be used to name
# the columns in the X_[type].txt files.
features <- read.table("UCI-HAR-Dataset/features.txt")[, 2]

# Of the above features, locates the ones that describe the mean and standard 
# deviation for each measurement.
# NOTE: The features whose name end in -meanFreq() are a third set of features!
#       This was discussed in the forum at 
#       https://www.coursera.org/learn/data-cleaning/discussions/weeks/4/threads/Z8wDu0X7EeazPQoUWGdJ9Q/replies/PoEruEq0EeaVABKtWz_zNw/comments/K5zlhUtTEeaVABKtWz_zNw
required_features <- sort(union(
    grep("-mean\\(\\)", features), 
    grep("-std\\(\\)", features)
))

################################################################################
##                                                                            ##
## Objectives 1 to 4                                                          ##
## 1 - Merges the training and the test sets to create one data set.          ##
## 2 - Extracts only the measurements on the mean and standard deviation for  ##
##     each measurement.                                                      ##
## 3 - Uses descriptive activity names to name the activities in the data set ##
## 4 - Appropriately labels the data set with descriptive variable names.     ##
##                                                                            ##
################################################################################

# Initialises the merged dataset as an empty data.frame
har_merged <- data.frame()

# For both the train and test data...
for (type in c("train", "test")) {

    # Loads the data
    temp_data <- read.table(paste0(
        "UCI-HAR-Dataset/", type, 
        "/X_", type, ".txt", 
        sep = "")
    )

    # Assigns the features names to the columns names
    names(temp_data) <- features

    # Keeps the required columns only
    temp_data <- temp_data[, required_features]

    # Reads the subject identifiers the data is associated to
    temp_subjects <- read.table(paste0(
        "UCI-HAR-Dataset/", type, 
        "/subject_", type, ".txt", 
        sep = "")
    )[, 1]

    # Integrates the subject identifiers in the data 
    temp_data$subject_identifier <- temp_subjects
    
    # Reads the class labels and assigns column names
    temp_class_labels <- read.table(paste0(
        "UCI-HAR-Dataset/", type, 
        "/y_", type, ".txt", 
        sep = "")
    )
    names(temp_class_labels) = c("class_label")

    # Matches the class labels with the respective activity names
    temp_class_labels <- left_join(
        temp_class_labels, 
        activities, 
        by = c("class_label" = "class_label")
    )

    # Integrates the activity names in the data 
    temp_data$activity_name <- temp_class_labels$activity_name

    # Copies the data to the merged dataset
    har_merged <- rbind(har_merged, temp_data)

}

################################################################################
##                                                                            ##
## Objective 5                                                                ##
## 5 - From the data set in step 4, creates a second, independent tidy data   ##
##     set with the average of each variable for each activity and each       ##
##     subject.                                                               ##
##                                                                            ##
################################################################################

# Note, this is an extremely concise and elegant form dplyr allows us to use, 
# but a warning will be triggered for each non-numerical column, for which
# applying the mean does not make sense. The "suppressWarnings" statement that
# wraps the command hides those.
suppressWarnings(
    har_averages <- har_merged %>% 
        group_by(activity_name, subject_identifier) %>%
        summarise_each(funs(mean))
)

# as from specifications...
write.table(har_averages, file = "har_averages.txt", eol = "\n", row.name = FALSE)

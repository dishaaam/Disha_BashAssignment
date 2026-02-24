Name: Disha

Questions Attempted:
Q1 - System Information Display
Q2 - File and Directory Manager
Q3 - Log File Analyzer
Q4 - Automated Backup Script
Q5 - User Account Reporter

---------------------------------------

HOW TO RUN EACH SCRIPT:

Q1:
chmod +x q1_system_info.sh
./q1_system_info.sh

Q2:
chmod +x q2_file_manager.sh
./q2_file_manager.sh

Q3:
chmod +x q3_log_analyzer.sh
./q3_log_analyzer.sh access.log

Q4:
chmod +x q4_backup.sh
./q4_backup.sh

Q5:
chmod +x q5_user_report.sh
./q5_user_report.sh

---------------------------------------

SAMPLE TEST CASES:

Q1:
Executed script and verified system details are displayed correctly.

Q2:
Tested creating, deleting, renaming files.
Tested invalid inputs and non-existing files.

Q3:
Tested with access.log file and non-existing file to check error handling.

Q4:
Created a backup directory to test.
Tested both simple copy and tar.gz options.

Q5:
Executed script and verified user statistics,
group information and security checks.

---------------------------------------

CHALLENGES FACED:

- It was quite challenging for me to understand how to use awk with /etc/passwd and /etc/group.
- Managing file permissions and execution rights.
- Also debugging output redirection issues.
- Question 5 itself was challenging.
---------------------------------------

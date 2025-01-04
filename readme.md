Nikto Scanner with Docker and Python  
This project is a containerized web vulnerability scanner using Nikto. It allows you to analyze websites for vulnerabilities by running a Nikto scan and saving the output in JSON format.  

Features  
Automatically installs and configures Nikto with SSL/TLS support.  
Simple Python interface for initiating scans.  
Outputs results as a JSON file for easy parsing and analysis.  
Dockerized for portability and ease of use.  
Prerequisites  
Docker and Docker Compose installed on your system.  
Basic familiarity with command-line tools.  
Project Structure  
bash  
Copy code  
niktoScanner/  
├── Dockerfile          # Defines the container's environment and dependencies  
├── docker-compose.yml  # Manages multi-container Docker applications  
├── run_scan.py         # Python script to execute Nikto scan    
├── output/             # Directory where scan results are saved  
How to Use  
1. Clone the Repository  
bash  
Copy code  
git clone https://github.com/<your-username>/niktoScanner.git  
cd niktoScanner  
2. Build the Docker Image  
bash  
Copy code  
docker-compose build  
3. Run the Scanner  
Start the container and follow the prompts:  

bash  
Copy code  
docker-compose up  
When prompted, enter the target website URL, such as:  

bash  
Copy code  
Enter the target website URL (e.g., http://example.com): https://example.com  
4. View the Results  
The scan results are saved in the output/ directory on your host machine:  

bash  
Copy code  
output/nikto_results.json  
Example Output  
Here’s an example of the JSON output:   

json  
Copy code  
{  
  "host": "https://example.com",  
  "scan_results": [  
    {  
      "id": "1",  
      "description": "Sample vulnerability detected",  
      "severity": "High"  
    },  
    {  
      "id": "2",  
      "description": "Outdated software version",  
      "severity": "Medium"  
    }  
  ]  
}  
Troubleshooting  
SSL/TLS Support Error  
If you encounter the error:  

vbnet  
Copy code  
ERROR: -ssl was specified but TLS/SSL is not available.  
Ensure that the Dockerfile installs libssl-dev and related Perl modules correctly.  

Python Script Not Executing  
Verify the container is running and that run_scan.py is present in the correct location inside the container:  

bash  
Copy code  
docker exec -it nikto-scanner-nikto-scanner-1 /bin/bash  
Permission Errors on Output Files  
Ensure that the output/ directory exists and is writable by the container:  

bash  
Copy code  
chmod 777 output/  
Contributions  
Contributions are welcome! Please fork this repository and submit a pull request with your changes.  

License  
This project is licensed under the MIT License. See the LICENSE file for details.  

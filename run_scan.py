import subprocess
import os

def run_nikto_scan(target_url):
    # Ensure the output directory exists
    output_dir = "/output"
    os.makedirs(output_dir, exist_ok=True)

    # Output file for JSON results
    output_file = os.path.join(output_dir, "nikto_results.json")

    # Run Nikto scan
    print(f"Running Nikto scan on {target_url}...")
    subprocess.run(
        [
            "perl", "/usr/local/nikto/program/nikto.pl",
            "-host", target_url,
            "-Format", "json",
            "-output", output_file
        ],
        check=True
    )
    print(f"Scan complete. Results saved to {output_file}")

if __name__ == "__main__":
    target_url = input("Enter the target website URL (e.g., http://example.com): ")
    run_nikto_scan(target_url)

<h1>ft_services</h1>
<p>42 project, setup of a Kubernetes cluster. The project consists of setting up an infrastructure of different services. Need to set up a multi-service cluster. Each service will have to run in a dedicated container. Each container must bear the same name as the service concerned and for performance reasons, containers have to be build using Alpine Linux. Also, they will need to have a Dockerfile which is called in the setup.sh. Services include an nginx, an FTPS, a Wordpress and a PHPMyAdmin working with a MySQL database, and a Grafana linked to an InfluxDB database for monitoring. The script builds the custom Docker images for each of those, before deploying and exposing them all with custom yaml files.</p>
<h2>Final grade : 100/100</h2>
<p>Mandatory part : 100/100</p>
<h3>How to use it</h3>
<p>Simply run the setup script :</p>
<pre>
<code>./setup.sh</code>
</pre>

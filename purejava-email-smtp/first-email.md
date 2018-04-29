# Add Ogham dependency


![___][___]

  ![Maven][maven-logo]
  --------------------

  <pre class="file" data-filename="pom.xml" data-target="insert" data-marker="<!-- Include ogham dependency here -->">
    &lt;dependency&gt;
      &lt;groupId&gt;fr.sii.ogham&lt;/groupId&gt;
      &lt;artifactId&gt;ogham-all&lt;/artifactId&gt;
      &lt;version&gt;2.0.0&lt;/version&gt;
    &lt;/dependency&gt;
  </pre>

  ![Gradle][gradle-logo]
  ----------------------
  
  <pre class="file" data-filename="build.gradle" data-target="insert" data-marker="// Include ogham dependency here">
    compile "fr.sii.ogham:ogham-all:2.0.0"
  </pre>

![___][___]


# Prepare Ogham

<pre class="file" data-filename="src/main/java/FirstEmail.java" data-target="insert" data-marker="// Add initialization code here">
MessagingService service = MessagingBuilder.standard()
        .environment()
            .properties()
                .set("mail.smtp.host", "host01")  // host available for demo email server
                .set("mail.smtp.port", "10025")   // smtp port available for demo email server
                .and()
            .and()
        .build();
</pre>


<pre class="file" data-filename="src/main/java/FirstEmail.java" data-target="prepend">
import fr.sii.ogham.core.builder.MessagingBuilder;
</pre>

# Send your first email

<pre class="file" data-filename="src/main/java/FirstEmail.java" data-target="insert" data-marker="// Add email sending code here">
service.send(new Email()
      .from("sender-email-adress@your-provider.com")  // you can use anything you want as sender
      .subject("This is the subject of the email")
      .content("This is the content of the email")
      .to("demo-user@example.org"));   // this is the email address used by the demo email server
</pre>

<pre class="file" data-filename="src/main/java/FirstEmail.java" data-target="prepend">
import fr.sii.ogham.core.service.MessagingService;
import fr.sii.ogham.email.message.Email;
</pre>

# Build


![___][___]

  ![Maven][maven-logo]
  --------------------

  `mvn package`{{execute}}


  ![Gradle][gradle-logo]
  ----------------------

  `gradle build`{{execute}}

![___][___]

# Run

`java -cp target/your-artifact-0.0.1-SNAPSHOT.jar FirstEmail`{{execute}}



[___]: //rawgit.com/aurelien-baudet/ogham-katacoda-scenarios/master/resources/images/1px.png
[maven-logo]: //rawgit.com/aurelien-baudet/ogham-katacoda-scenarios/master/resources/images/icons/maven-logo.png
[gradle-logo]: //rawgit.com/aurelien-baudet/ogham-katacoda-scenarios/master/resources/images/icons/gradlephant-logo.png

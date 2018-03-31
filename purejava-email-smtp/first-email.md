# Add Ogham dependency


<pre class="file" data-filename="pom.xml" data-target="insert" data-marker="<!-- Include ogham dependency here -->">
&lt;dependency&gt;
  &lt;groupId&gt;fr.sii.ogham&lt;/groupId&gt;
  &lt;artifactId&gt;ogham-all&lt;/artifactId&gt;
  &lt;version&gt;2.0.0&lt;/version&gt;
&lt;/dependency&gt;
</pre>


# Prepare Ogham

<pre class="file" data-filename="src/main/java/FirstEmail.java" data-target="insert" data-marker="// Add initialization code here">
MessagingService service = MessagingBuilder.standard()
        .environment()
            .properties()
                .set("mail.smtp.host", "host01")
                .set("mail.smtp.port", "587")
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
    .from("myusername@myprovider.com")
    .subject("subject")
    .content("email content")
    .to("ogham-test@yopmail.com"));
</pre>

<pre class="file" data-filename="src/main/java/FirstEmail.java" data-target="prepend">
import fr.sii.ogham.core.service.MessagingService;
import fr.sii.ogham.email.message.Email;
</pre>

# Build with Maven

`
mvn package
`{{execute}}


# Run

`
java -cp target/your-artifact-0.0.1-SNAPSHOT.jar FirstEmail
`{{execute}}

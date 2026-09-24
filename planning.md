# **TakeMeter planning.md**

## Community
The community I chose was **r/ariheads** from Reddit, and specifically chose threads discussing Ariana Grande's latest album, titled *Petal*. I chose this community because I know that Petal was devisive among her fanbase (which I'm a part of) and that there would be varied opinions and types of comments surrounding the album.

## Labels
I have four labels: Experience, Analysis, Praise, Critical.

The `experience` will denote personal experience with the music like anecdotes or places where the music was listened to by a person. Also when the comments have people where they relate the music to their own or others lives.

The `descriptive` label will denote when the users are describing the music like with emotions or analyzing the music. This includes comments where specific tracks are listed off, relating the music to what the public knows about Ariana, the technical side of how the music was made like production and lyrics, as well as describing the vibe of the music (is it sad, dark, expressive, etc.).

The `critical` label will denote comments where people point out their issues with the album, and encompass the comments where people do not like it and explain why.

The `approval` label will be for comments that are praising, complimenting, and enjoying the album. This includes people who are celebrating and praising the work and ones where they explain why.

**Experience Examples:**
- "Same here! I wonder how it would feel to experience this album without that element of resonating with the pain and themes. It actually made me reflect a little because the feelings it evoked should not have felt so normal to me 😭😭"
- "Yeah. I feel like I understand her. This album has definitely moved me to tears, in the context of her life, and in the context of my own life. Im pretty sure thats hella parasocial tho."
- Unsure example: "same, I find it such an accurate portrayal of both the despair and hope I’ve experienced in my life, and more importantly - the magic and resilience in it all :)" This could go into experience or descriptive since it's describing the albums portrayal of certain feelings, but the user relates it to their own life.

**Descriptive Examples**
- "Petal, to me, is the other side of ES. It was initially a hard listen for me because I get emotional listening to music easily and I've been an Ari Stan since 2010 but this really is a darker album because she's been through hellllll and I think this album was brutal acceptance. As someone with complex trauma there comes a time when the love and light wears off."
- "Honestly I think Petal the album is the kind of music she has alway wanted to make and experiment with. She said she only did the big pop hits early in her career so the record label would trust her to eventually do whatever she wants and I think she got that wish with petal. And I vibe with it."
- Unsure example: "Honestly I listen to it because in a way I relate to the pain but yeah it’s a dark album compared to her last"

**Critical Examples**
- "I disagree. I’ll probably have to listen to full album again but only 2 or 3 of the songs I find myself replaying. A lot of them sound kinda boring/similar with the same riffs and runs she always does. I also feel some songs don’t feel mature. There’s nothing too unique sounding besides petal and HTIMYLM. Usually for me when she releases an album it will be on repeatttt. And every song has something that is so addictive. This one isn’t finding me yet. Just my opinion…"
- "tbh its probably one of my least favorite albums, i dont know how to explain it but the songs just dont seem as put together as her other work, i love some songs but i just am underwhelmed with the album as a whole"
- Unsure example: "I like about three tracks off it." This mostly to me seems like a clear comment to go under critical but it's very short and it kind of means you have to assume about it. Like the takeaway is that the user only like three songs meaning the rest of the album is whatever to them, so the critical aspect of the comment is not outrightly stated and exists within subtext (obvious subtext but still.)

**Approval Examples**
- "same i adore this album so much can't stop replying it since it has released"
- "It is 100% one of her top 3 albums. Every single song is so so good. I cant pick a favorite. They’re all so perfect. I love everything about it."
- Unsure example: "I’ve been a casual listener for a long time. Always respected her vocal and comedic abilities, featured her in some playlists, but never made an effort to listen to her albums start to finish for whatever reason. Eternal Sunshine and Petal I listened to start to finish multiple times and I watched the music videos. They feel much more emotionally raw, grounded, and cohesive. I really like the direction she’s taken in her music lately and I respect that artistically" This is a user who approves of the recent album but also describes it as raw, grounded and cohesive, whcih could make it belong under descriptive.

**Post AI Consulation**

I asked Copilot about my labels and for potentially more sufficient labeling ideas. Like I thought, it told me that `descriptive`, `approval`, and `critical` have a lot of overlap. It suggested `Personal Response`, `Interpretation & Analysis`, `Positive Evaluation`, and `Mixed to Negative Evaluation`. I agree with these suggestions since they allow for more comments to be less ambiguous even if they still have some overlap.

## Hard Edge Cases
Posts that contain both positive and negative elements will usually be ambiguous. That is why the new 4th label is mixed-negative together, still some comments might be really positive about the album and talk about its pros more than its cons. When annotating, before putting those type of postive leaning comments in the mixed-negative label group, I'd have to see if the ratio between positive and negative feelings expressed in the comments justifies its position.

## Data Collection Plan
The initial posts I gathered were *"Petal is rly sad"*, *"Petal is her best work"*, and *"Your honest opinion on petal"*. If a label is underrepresented I'll have to get another thread that I think will mostly contain comments that can fufill what's missing.

## Evaluation Metrics
Evaluation for macro F1 or equal labeling treatment, especially if a label ends up underepresented. Evaluation for per-label precision and recall which shows whether the agent misses a label category or overuses one. Evaluation for label accuracy, and when a label is ambiguous, if it highlights that uncertainty alongside still putting it under the label it decides is best fit. Also for comment ambiguity handling, evaluation for choosing said best fit label, its explanation, if it includes an uncertainty disclaimer if warranted, and if it avoids hallucinating non explicity stated meaning. Finally there should be consistency evaluation by giving the agent the same comment with small variations to see if it responds the same everytime and evaluation of its explanation quality, do the explanations make sense with the label chosen.

## Definition of Success
If the agent achieves strong performance in the macro f1 and per-label precision-recall fields. Strong label accuarcy, explanations, correct pointing out of ambiguity for certain hard to place comments, even when ultimately that comment still gets placed under the label it believes is the best. Little to no hallucinating of labels or explanations or contrived meanings. And lastly, the agent is consistent.

## AI Tool Plan

- Label Stress Testing:

  The following posts from the CSV sit at the boundary between two labels. They can be used to test whether the agent notices overlapping evidence instead of forcing an overconfident label.

  1. **Personal Response / Interpretation & Analysis**

	  > Honestly I listen to it because in a way I relate to the pain but yeah it’s a dark album compared to her last

	  This is a short boundary case because relating to the pain supports Personal Response, while describing the album as dark supports Interpretation & Analysis. The agent should identify which part is the primary purpose of the comment and note the uncertainty caused by the other part.

    Manual classification: **Personal Response**

  2. **Personal Response / Interpretation & Analysis**

	  > same, I find it such an accurate portrayal of both the despair and hope I’ve experienced in my life, and more importantly - the magic and resilience in it all :)

	  The phrase “I’ve experienced in my life” is a direct personal response, but the comment also analyzes the album’s portrayal of despair, hope, and resilience.

    Manual classification: **Personal Response**

  3. **Personal Response / Positive Evaluation**

	  > I was listening to it in full in the car yesterday and when I parked up and turned it off I was like... wow that was so sad, but it’s such a cathartic listen

	  The listening anecdote supports Personal Response, while calling the album cathartic is a positive evaluation. The sadness also makes this useful for testing whether the agent mistakes an emotional reaction for criticism.
    
    Manual classification: **Personal Response**

  4. **Personal Response / Positive Evaluation**

	  > I listen to it every morning while I commute to work. I like the setting and the vibes overall. I also like how in a different pov the whole album can be about her toxic fans and the relationship of Ariana with them. I love most songs especially from big feelings to bunny hop. Interlude is a fucking masterpiece once again. Oh well and nowhere nobody are a skip for me (I still listen to them though). Overall it’s my 3rd fav with the ranking going 1. ES 2. Positions 3. Petal, but I’m sure it will go up at some point. Also the fact that it “doesn’t go well like the other albums”, kinda makes me like it more as it feels more personal, the less fuzz the better (idk if it makes sense, I’m not being derogatory)

	  The commute routine and repeated listening support Personal Response, while the interpretation of the album and the enthusiastic ranking support Positive Evaluation. The “skip” comment adds a small negative element without making Mixed to Negative Evaluation clearly dominant.

    Manual classification: **Positive Evaluation**

  5. **Interpretation & Analysis / Positive Evaluation**

	  > Petal, to me, is the other side of ES. It was initially a hard listen for me because I get emotional listening to music easily and I’ve been an Ari Stan since 2010 but this really is a darker album because she’s been through hellllll and I think this album was brutal acceptance. As someone with complex trauma there comes a time when the love and light wears off.

	  The comment analyzes the album’s themes and relationship to Eternal Sunshine, but it also includes personal history and a positive or sympathetic response to the album’s artistic expression. The agent must decide whether the analysis or personal reaction is central.

    Manual classification: **Interpretation & Analysis**

  6. **Interpretation & Analysis / Positive Evaluation**

	  > I’ve been a casual listener for a long time. Always respected her vocal and comedic abilities, featured her in some playlists, but never made an effort to listen to her albums start to finish for whatever reason. Eternal Sunshine and Petal I listened to start to finish multiple times and I watched the music videos. They feel much more emotionally raw, grounded, and cohesive. I really like the direction she’s taken in her music lately and I respect that artistically

	  Describing the albums as “emotionally raw, grounded, and cohesive” is analysis, while “I really like” and “I respect” are clear positive evaluation. The listening history is personal context but is not necessarily the main label.

    Manual classification: **Positive Evaluation**

  7. **Positive Evaluation / Mixed to Negative Evaluation**

	  > Personally, I don’t agree that this is her best album, but I still really like it and it’s growing on me more and more every day. Upon first listen, I felt a little split on my opinion of it. I was halfway disappointed with the album as a whole, but I still throughly enjoyed quite a few tracks. My favorites are big feelings, petal, and never get over me. i also love kiss me stay, oh well, warning signs, like i do, and bad thing bunny hop (lol the whole rest of the album) Initially i thought some of the other tracks were a bit weaker for me, like bad thing bunny hop did not hit for me on the first listen but now im loving that track, i like how different it is for ari, its just a really sweet and feel good song. I don’t really like freak or nowhere, nobody. I can’t really see myself listening to those at all ☹️ Overall I still think her best albums are Positions, Sweetener, and Eternal Sunshine; these albums just feel much more cohesive and the tracks are all very complimentary of each other and just feel like solid pieces of art, whereas with petal i just feel that some of the songs held back in alot of ways, mainly in the vocals. I think her voice could have been utilized differently in some of the tracks. And I love songs that are complete ear worms and have addictive replay value and this album is lacking that for me aside from big feelings, that’s really the only track i keep hitting replay on because it’s so good. I still don’t know where I’d place Petal yet, maybe it will make its way into fourth place for me eventually.

	  This is the clearest mixed-sentiment case. It contains extensive praise, but also disappointment, disliked songs, and specific criticism of the vocals and replay value. The stress test is whether the agent explains why one label is dominant rather than simply counting positive and negative words.

    Manual classification: **Mixed to Negative Evaluation**

  8. **Positive Evaluation / Mixed to Negative Evaluation**

	  > It’s in the bottom half of my rankings if I’m being honest but in no way is it her worst work I think it’d be another artists best work actually. Anyways what do you think about it, no judgement if you think it’s her best or worst lmao.

	  “Bottom half” is a negative evaluation, but the comment strongly qualifies that judgment by calling the album another artist’s best work. This tests whether the agent can recognize a positive-leaning mixed opinion rather than automatically assigning Mixed to Negative Evaluation.

    Manual classification: **Mixed to Negative evaluation**
    
    **Conclusion**

    Out of eight stress test random ambiguous comment examples, seven were clear to place. The only one that made me a longer pause was number 6 because the poster used three diffrent describing words: raw, grounded, cohesive. But the sentence after that is back to being approving and affirming of the album so it belongs mainly under the positive evaluation label.

- Annotation Assistance:

    I will be annotating myself, but will ask copilot for certain comments that I find particulary hard to place.

- Failure Analysis:

    I'll give copilot/claude any recorded mistakes my agent makes in labeling, explanations, and the other success metrics. I'll ask copilot to look for patterns within the given compiled errors record. Error records would include when the agent gets the labels for a comment wrong or mixes them up, failures to recognize ambiguity, explanations are weak, hallucinations, or repeated consistency failures. Pattern recognition process: Each mistake would be recorded with the comment, my label, the agent's predicted label, its explanation, and my reason why the prediction is wrong. This compiled error records list would get given to copilot with the following questions:
        - Which labels get confused the most for another?
        - Are errors more common in short or long comments?
        - Does the agent overvalue positive or negative words?
        - How often do personal response and interpretation & analysis labels get mishandled (mistaken/conflated w/ eachother or explanations are weak)?
        - Before ultimately deciding what it thinks is the best label for an ambiguous comment, how often or how little does the agent express uncertainty due to the comment's ambiguity?
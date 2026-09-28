# TakeMeter


## Community Choice
The community I chose was **r/ariheads** from Reddit, and specifically chose threads discussing Ariana Grande's latest album, titled *Petal*. I chose this community because I know that *Petal* was devisive among her fanbase (which I'm a part of) and that there would be varied opinions and types of comments surrounding the album.

## Label Taxonomy
I have four labels: Personal Response, Interpretation & Analysis, Positive Evaluation, and lastly Mixed to Negative Evaluation

(At other points in this README the labesls will be adressed as PR, IA, PE, and MNE respectively.)

The `Personal Response` label will denote comments that focus primarily on the user's own emotional reaction, lived experience, relationship to the music, or listening habits. This includes relating the album to personal hardship, describing how it affected them, and sharing anecdotes such as listening to it during a commute or seeing it performed live.

Example: "same, i'm going through a ton of shit right now no normal person should be expected to shoulder. yet, we are. and here's petal to listen to"

The `Interpretation & Analysis` label will denote comments that explain, describe, or interpret the album beyond simply stating whether the user likes it. This includes discussing themes, lyrics, specific songs, production, vocal choices, influences, artistic intent, the artist's relationship with the public, and comparisons with other albums or artists.

Example: "It’s sad, but hopeful, and there’s a kind of enlightenment in it—a sense of self-realization. It definitely sounds like she’s been through a lot, but to me it also feels like someone setting boundaries and finding her footing again. There’s a real resilience to it. I enjoy and appreciate the album for that."

The `Positive Evaluation` label will denote comments that express an overall favorable judgment of the album, its songs, or its artistry. This includes praise, enjoyment, appreciation, enthusiastic recommendations, claims that the album is among the artist's best, and positive comments that contain minor reservations but remain clearly approving overall.

Example: "I absolutely love this album 🥺 it hurts to see people shitting on it"

The `Mixed to Negative Evaluation` label will denote comments that express a substantially qualified, unfavorable, or disappointed judgment of the album. This includes dislike, underwhelming reactions, low rankings, skips, comparisons that place the album below other work, and specific criticism of its lyrics, vocals, production, structure, or replay value. Comments with both praise and criticism belong here when the criticism is substantial or is the dominant overall assessment.

Example: "Petal on its own is sadly one of my least favourite projects of her BUT the live recordings gave it the spark that it was missing. Even to this day when I try to play stay or like i do in their studio recordings, I end up feeling super underwhelmed, whereas I absolutely adore them in the live album. Had she decided to (re)record it with the added grit, power and the additional adlibs and melodic changes, I think it could have been in my top 5 projects of her."

## Data Collection
The posts I gathered were from the following r/ariheads subreddit threads: *"Petal is rly sad"*, *"Petal is her best work"*, and *"Your honest opinion on petal"*. I had my csv formatting cleaned up with the help of Codex but the labeling of all 286 cooments were done manually by myself. Personal Response had the most with `108` comments. Mixed to Negative Evaluation was the second highest with `71` comments. Positive Evaluation had `55` and Interpretation & Analysis had `52`.

**Difficult to Label Examples w/ My Final Decisions**

- Example 1 (Between Personal Response and Interpretation & Analysis)

"Honestly I listen to it because in a way I relate to the pain but yeah it’s a dark album compared to her last"

My decision: Personal Response

- Example 2 (Between Interpretation & Analysis and Positive Evaluation)

"I’ve been a casual listener for a long time. Always respected her vocal and comedic abilities, featured her in some playlists, but never made an effort to listen to her albums start to finish for whatever reason. Eternal Sunshine and Petal I listened to start to finish multiple times and I watched the music videos. They feel much more emotionally raw, grounded, and cohesive. I really like the direction she’s taken in her music lately and I respect that artistically"

My decision: Positive Evaluation

- Example 3 (Between Personal Response and Positive Evaluation)

"I listen to it every morning while I commute to work. I like the setting and the vibes overall. I also like how in a different pov the whole album can be about her toxic fans and the relationship of Ariana with them. I love most songs especially from big feelings to bunny hop. Interlude is a fucking masterpiece once again. Oh well and nowhere nobody are a skip for me (I still listen to them though). Overall it’s my 3rd fav with the ranking going 1. ES 2. Positions 3. Petal, but I’m sure it will go up at some point. Also the fact that it “doesn’t go well like the other albums”, kinda makes me like it more as it feels more personal, the less fuzz the better (idk if it makes sense, I’m not being derogatory)"

My decision: Positive Evaluation

## Fine-tuning Approach

- **Base Model Setup:** Baseline model was done using Sections 1 and 5 of the Colab notebook. Label mappings were defined for each of my labels: 0, 1, 2, 3 for Personal Response, Interpretation & Analysis, Positive Evaluation, Mixed to Negative Evaluation respectively. My Takemeter data - cleaned.csv was then uploaded and my dataset was validated. In section 5, my baseline classifier (Groq) is ran for zero shot baseline using openai/gpt-oss-120b, which was changed from the deprecated meta-llama mode. In response, I had to increase tokens to 300 from 20 for the replacement. My system prompt was 2028 characters and is under the Baseline Description and Results section of this README. Only 3 out of 43 responses ended up not being parsed.

- **Training Setup:** In Section 2 of the Colab notebook, my data was split into train / validation / test sets (70%/15%/15% resepectively). Training count was 200 out of 286. Validation and Testing were both 43 out of 286. Training label distribution for PR, IA, PE, and MNE was 38, 36, 76 and 50 respectively. For test label distribution it was 9, 8, 16 and 10 respecteively. Next the tokenizer was loaded and splits were tokenized.

- **Hyperparameter decision(s):** I changed epochs from 3 to 5 and learning rate from 2e-5 to 3e-5 becuase when it was set to those defaults, the fine-tuning model was putting every single comment under positive evaluation. Changing these valuses gave a more expected variety.

## Baseline Description and Results

**System Prompt**

You are classifying reddit comments about the Ariana Grande album titled 'Petal'
from the three threads titled 'Petal is rly sad', 'Petal is her best work', and
'Your honest opinions on petal' from r/ariheads subreddit.
Assign each post to exactly one of the following label categories:

Personal Response: Comments that focus primarily on the user's own emotional reaction, lived experience, relationship to the music, or listening habits.
Example: "same, i'm going through a ton of shit right now no normal person should be expected to shoulder. yet, we are. and here's petal to listen to"

Interpretation & Analysis: Comment that explain, describe, or interpret the album beyond simply stating whether or not the user likes it.
Example: "It’s sad, but hopeful, and there’s a kind of enlightenment in it—a sense of self-realization. It definitely sounds like she’s
been through a lot, but to me it also feels like someone setting boundaries and finding her footing again. There’s a real resilience to it. I
enjoy and appreciate the album for that."

Positive Evaluation: Comments that express overall favorable judgement of the album, its songs, or its artistry.
Example: "I absolutely love this album 🥺 it hurts to see people shitting on it"

Mixed to Negative Evaluation: Comments that express a substantially qualified, unfavorable, or disappointed judgement of the album.
Example: "Petal on its own is sadly one of my least favourite projects of her BUT the live recordings gave it the spark that it was missing.
Even to this day when I try to play stay or like i do in their studio recordings, I end up feeling super underwhelmed, whereas I absolutely
adore them in the live album. Had she decided to (re)record it with the added grit, power and the additional adlibs and melodic changes, I
think it could have been in my top 5 projects of her."

Respond with ONLY the label name.
Do not explain your reasoning.

Valid labels:
Personal Response
Interpretation & Analysis
Positive Evaluation
Mixed to Negative Evaluation

After running the function classify_with-groq(text), as stated earlier, 40 out of 43 responses were able to be parsed. (There was one time where it parsed all 43 but runtime disconnection made me lose that data.)

**Baseline Results**

🎯 Baseline accuracy: 0.581 (evaluated on 40/43 parseable responses)

Per-class metrics (baseline):

**Personal Response**

- Precision: 0.38
- Recall: 1.00
- f1-score: 0.55
- Support: 8

**Interpretation & Analysis**

- Precision: 0.75
- Recall: 0.43
- f1-score: 0.55
- Support: 7

**Positive Evaluation**

- Precision: 0.75
- Recall: 0.38
- f1-score: 0.50
- Support: 16

**Mixed to Negative Evaluation**

- Precision: 1.00
- Recall: 0.78
- f1-score: 0.88
- Support: 9


**Accuracy**

- Precision:
- Recall:
- f1-score: 0.60
- Support: 40

**Macro Avg**

- Precision: 0.72
- Recall: 0.65
- f1-score: 0.62
- Support: 40

**Weighted Avg**

- Precision: 0.73
- Recall: 0.60
- f1-score: 0.60
- Support: 40

**Findings/Hypothesis**

Personal Response has high recall and low precision. Positive Evaluation and Interpretation & Analysis both have low recall. Mixed to Negative Evaluation has a great f1-score and is the most on track of the four labels.

**Hypothesis:** Personal Response is high recall and low precision because alot of other comments have phrases like "I love" or "I think" in them which is leading the model to get all the ones its supposed to but also take comments that belong in other label groups because those phrases are in them. Mixed to Negative Evaluation is good because dislike language is easy to separate from the rest. Positive Evaluation and Interpretation & Analysis are both suffering from low recall because Personal Response is probably leeching from them for the reasons stated earlier. A lot of the comments from these two labels do include prefaces or ending lines with phrases like "I like" or "I love" but the comments full context belong mostly in Positive or Analysis.

## Evaluation Report

**Wrong Prediction Analysis**

- Example 1

Text:      I think it’s her worst album
True:      Mixed to Negative Evaluation
Predicted: Positive Evaluation  (confidence: 0.37)

- Example 2

Text:      Yeah. I feel like I understand her. This album has definitely moved me to tears, in the context of her life, and in the context of my own life. Im pretty sure thats hella parasocial tho.
True:      Personal Response
Predicted: Positive Evaluation  (confidence: 0.29)

- Example 3

Text:      I do think it was slightly rushed in a way where if she would’ve maybe thought it out a little longer it could’ve been better. But it being put out so fast was because she needed to make it so it feel...
True:      Mixed to Negative Evaluation
Predicted: Interpretation & Analysis  (confidence: 0.27)

 **Sample Classifications**

| Post (truncated) | True label | Predicted | Confidence | Correct? |
|---|---|---|---|---|
| I think I’m feeling this way too. Im such a huge longtime fan, I caNNOT stop listening to ... | Positive Evaluation | Positive Evaluation | 0.35 | yes |
| There are still people questioning Petal? It's her best album to date. Most grown up music... | Positive Evaluation | Positive Evaluation | 0.30 | yes |
| I do think occasionally the lyrics lean into cliche or stuff we heard from her before. I t... | Mixed to Negative Evaluation | Mixed to Negative Evaluation | 0.31 | yes |
| for me personally, it's way deeper than the pain of living in the end times 💀 but yeah, i'... | Personal Response | Positive Evaluation | 0.30 | no |
| I hope things get better soon ❤️‍🩹 | Personal Response | Positive Evaluation | 0.43 | no |



**Results Comparison**

| Model | Accuracy |
|---|---|
| Zero-shot baseline (Groq) | 0.600 |
| Fine-tuned DistilBERT | 0.488 |

Fine-tuning regression: 0.112

## Reflection

## Spec Reflection

## AI Usage
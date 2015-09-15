# Data model and migration: high level overview

## Current data model

Data model after migration - [ER-Diagram](https://cloud.githubusercontent.com/assets/557395/9845780/4a1989e6-5ad6-11e5-9e0d-9fb6769638a5.png)

### Entities

- `Trial` - the main entity, clinical study (16k)
- `Source` - source of data, e.g. "Cochrane" (1)
- `Condition` - illness, injury, impairment etc (256)
- `Method` - trial type, methodology (45)
- `Drug` - a chemical substance to heal people (0)
- `Review` - a publication about a trial (19764)
- `Document` - blob document to associate with any entity (0)

### Relations

Any `Trial` has a `Source` (where we've got the data).

With `Trial` can be associated one or many (m2m relation):
- `Condition`
- `Method`
- `Drug`
- `Review`
- `Document`
 
With `Review` can be associated one or many (m2m relation):
- `Document`

## Cochrane's missing

The cochrane database lacks:
- structured data about `Drug` (only as a free text interventions mixed with other data)
- codified data about `Condition` (only as a free text)
- long scientific title for `Trial.scientific_title`
- data about sponsors for `Trial.source_of_funding`
- trial date range information for `Trial.date_from`, `Trial.date_to`
- data about exclusion criteria for `Trial.exclusion_criteria`
- concrete data about participants age for `Trial.age_from`, `Trial.age_to`
- codified data about interventions for `Trial.interventions` (only as a free text)
- codified data about outcomes for `Trial.outcomes` (only as a free text)

## Current data model's missing

Important Cochrane's data we don't use:
- data about `Review`'s reviews like date, reviewer etc
- data about reviewers (306 items in Cochrane)
 
## Structuring data

For now we have not the data we've logically structured while the migration process. We've converted some m2m tables to arrays, added enum for sex etc. But it's not an adding a new structure.

## Notes



### captr: R Client for the Captricity API

[![MIT](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/soodoku/captr.svg?branch=master)](https://travis-ci.org/soodoku/captr)

OCR text and handwritten forms using [Captricity](https://captricity.com/). Captricity's big advantage over [Abbyy Cloud OCR](https://github.com/soodoku/abbyyR) is that it allows the user to easily specify the position of text-blocks that want to OCR; they have a simple web-based UI. The quality of the OCR can be checked using `compare_txt` from [recognize](https://github.com/soodoku/recognize). 

Before diving into captr, read this [small vignette](vignettes/Using_Captricity.Rmd).

### Installation

To get the current development version from GitHub:

```{r install}
install.packages("devtools")
devtools::install_github("soodoku/captr")
```

-------------------
### Using captr

Start by getting an application token and setting it using:

```{r set_token}
set_token("token")
```

Then, create a batch using:

```{r create_batch}
create_batch("batch_name")
```

Once you have created a batch, you need to get the template ID (it tells Captricity what data to pull from where). Captricity requires a template. These templates can be created using the [Web UI](https://shreddr.captricity.com/job/).

```{r set_tempid}
set_template_id("id")
```

Next, assign the template ID to a batch:
```{r temp_batch}
set_batch_template("batch_id", "template_id")
```

Next, upload image(s) to a batch
```{r upload_image}
upload_image(batch_id="batch_id", path_to_image="image_path")
```

Next, check whether the batch is ready to be processed:

```{r test_readiness}
test_readiness(batch_id="batch_id")
```

You may also want to find out how much would processing the batch set you back by:

```{r batch_price}
batch_price(batch_id="batch_id")
```

Once you are ready, submit the batch:
```{r submit_batch}
submit_batch(batch_id="batch_id")
```

Captricity excels in nomenclature confusion. So once a batch is submitted, it is then called a job. The id for the job can be obtained from 
the list that is returned from `submit_batch`. The field name is `related_job_id`.

To track progress of a job, use:

```{r track_progress}
track_progress(job_id ="job_id")
```

List all forms (instance sets) associated with a job:
```{r list_instance_sets}
list_instance_sets(job_id="job_id")
```

If you want to download data from a particular form, use the `list_instance_sets` to get the form (instance_set) id and run:
```{r get_instance_set}
get_instance_set(instance_set_id="instance_set_id")
```

Get csv of all your results from a job:
```{r get_all}
get_all(job_id="job_id")
```

------------------
#### License
Scripts are released under the [MIT License](https://opensource.org/licenses/MIT).


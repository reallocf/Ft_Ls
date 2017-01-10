/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_comparison_functions.c                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/13 23:44:10 by csummers          #+#    #+#             */
/*   Updated: 2016/12/13 23:44:13 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

long		ls_str_cmp(const char *s1, const char *s2, t_ls *ls_f)
{
	unsigned char	*u_s1;
	unsigned char	*u_s2;

	u_s1 = (unsigned char*)s1;
	u_s2 = (unsigned char*)s2;
	while (*u_s1 == *u_s2 && *u_s1 && *u_s2)
	{
		u_s1++;
		u_s2++;
	}
	return ((ls_f->r) ? *u_s1 - *u_s2 : *u_s2 - *u_s1);
}

static void	*ls_get_link_stats(const char *name)
{
	struct stat		*stats;
	char			*buff;
	int				temp;

	if (!(stats = (struct stat*)malloc(sizeof(struct stat))))
		ls_die(NULL);
	if (!(buff = ft_strnew(MAX_FNAME_LEN)))
		ls_die(NULL);
	if ((temp = readlink(name, buff, MAX_FNAME_LEN)) == -1)
		ls_die(NULL);
	buff[temp] = '\0';
	if (ft_strequ(name, buff))
	{
		if (lstat(name, stats) == -1)
			ls_die(NULL);
	}
	else if (stat(buff, stats) == -1)
		ls_die(NULL);
	free(buff);
	return (stats);
}

static long	ls_find_time_diff(struct stat **f1, struct stat **f2, t_ls *ls_f)
{
	long	diff;

	if (ls_f->u)
	{
		diff = (*f2)->st_atimespec.tv_sec - (*f1)->st_atimespec.tv_sec;
		if (!diff)
			diff = (*f2)->st_atimespec.tv_nsec - (*f1)->st_atimespec.tv_nsec;
	}
	else if (ls_f->c)
	{
		diff = (*f2)->st_ctimespec.tv_sec - (*f1)->st_ctimespec.tv_sec;
		if (!diff)
			diff = (*f2)->st_ctimespec.tv_nsec - (*f1)->st_ctimespec.tv_nsec;
	}
	else
	{
		diff = (*f2)->st_mtimespec.tv_sec - (*f1)->st_mtimespec.tv_sec;
		if (!diff)
			diff = (*f2)->st_mtimespec.tv_nsec - (*f1)->st_mtimespec.tv_nsec;
	}
	free(*f1);
	free(*f2);
	return ((ls_f->r) ? diff : -diff);
}

long		ls_time_cmp(const char *f1, const char *f2, t_ls *ls_f)
{
	struct stat		*f1_stats;
	struct stat		*f2_stats;
	long			res;

	if (!(f1_stats = (struct stat*)malloc(sizeof(struct stat))))
		ls_die(NULL);
	if (!(f2_stats = (struct stat*)malloc(sizeof(struct stat))))
		ls_die(NULL);
	if (lstat(f1, f1_stats) == -1)
		ls_die(NULL);
	if (lstat(f2, f2_stats) == -1)
		ls_die(NULL);
	if (S_ISLNK(f1_stats->st_mode))
	{
		free(f1_stats);
		f1_stats = ls_get_link_stats(f1);
	}
	if (S_ISLNK(f2_stats->st_mode))
	{
		free(f2_stats);
		f2_stats = ls_get_link_stats(f2);
	}
	res = ls_find_time_diff(&f1_stats, &f2_stats, ls_f);
	return ((res) ? res : ls_str_cmp(f1, f2, ls_f));
}

long		ls_time_cmp_l(const char *f1, const char *f2, t_ls *ls_f)
{
	struct stat		*f1_stats;
	struct stat		*f2_stats;
	long			res;

	if (!(f1_stats = (struct stat*)malloc(sizeof(struct stat))))
		ls_die(NULL);
	if (!(f2_stats = (struct stat*)malloc(sizeof(struct stat))))
		ls_die(NULL);
	if (lstat(f1, f1_stats) == -1)
		ls_die(NULL);
	if (lstat(f2, f2_stats) == -1)
		ls_die(NULL);
	res = ls_find_time_diff(&f1_stats, &f2_stats, ls_f);
	return ((res) ? res : ls_str_cmp(f1, f2, ls_f));
}

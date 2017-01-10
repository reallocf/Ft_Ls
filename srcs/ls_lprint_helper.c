/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_lprint_helper.c                                 :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/20 12:44:14 by csummers          #+#    #+#             */
/*   Updated: 2016/12/20 12:44:16 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

t_lflag			*ls_initialize_lflag(void)
{
	t_lflag		*ret;

	if (!(ret = (t_lflag*)malloc(sizeof(t_lflag))))
		ls_die(NULL);
	ret->link_width = 0;
	ret->name_width = 0;
	ret->group_width = 0;
	ret->size_width = 0;
	ret->major_width = 0;
	ret->minor_width = 0;
	return (ret);
}

int				ls_print_file_type(mode_t m)
{
	if (S_ISBLK(m) || S_ISCHR(m))
	{
		if (S_ISBLK(m) && write(1, "b", 1) == -1)
			ls_die(NULL);
		else if (S_ISCHR(m) && write(1, "c", 1) == -1)
			ls_die(NULL);
		return (1);
	}
	if (S_ISREG(m) && write(1, "-", 1) == -1)
		ls_die(NULL);
	else if (S_ISDIR(m) && write(1, "d", 1) == -1)
		ls_die(NULL);
	else if (S_ISLNK(m) && write(1, "l", 1) == -1)
		ls_die(NULL);
	else if (S_ISSOCK(m) && write(1, "s", 1) == -1)
		ls_die(NULL);
	else if (S_ISFIFO(m) && write(1, "p", 1) == -1)
		ls_die(NULL);
	return (0);
}

static char		*ls_get_time(struct stat *stats, t_ls *ls_f, int *diff)
{
	char	*ret;

	if (ls_f->u)
	{
		*diff = time(NULL) - stats->st_atimespec.tv_sec;
		ret = ctime(&stats->st_atimespec.tv_sec);
	}
	else if (ls_f->c)
	{
		*diff = time(NULL) - stats->st_ctimespec.tv_sec;
		ret = ctime(&stats->st_ctimespec.tv_sec);
	}
	else
	{
		*diff = time(NULL) - stats->st_mtimespec.tv_sec;
		ret = ctime(&stats->st_mtimespec.tv_sec);
	}
	return (ret);
}

void			ls_print_timing(struct stat *stats, t_ls *ls_f)
{
	int		diff;
	char	*time_str;
	char	*temp;
	char	*temp2;

	time_str = ls_get_time(stats, ls_f, &diff);
	if (diff > SIX_MONTHS_AGO || diff < 0)
	{
		temp = ft_strsub(time_str, 4, 6);
		temp2 = ft_strsub(time_str, 20, 4);
		ft_printf(" %s  %s", temp, temp2);
		free(temp2);
	}
	else
	{
		temp = ft_strsub(time_str, 4, 12);
		ft_printf(" %s", temp);
	}
	free(temp);
}

void			ls_print_permissions(mode_t m)
{
	errno = 0;
	(m & S_IRUSR) ? write(1, "r", 1) : write(1, "-", 1);
	(m & S_IWUSR) ? write(1, "w", 1) : write(1, "-", 1);
	if (m & S_ISUID)
		(m & S_IXUSR) ? write(1, "s", 1) : write(1, "S", 1);
	else
		(m & S_IXUSR) ? write(1, "x", 1) : write(1, "-", 1);
	(m & S_IRGRP) ? write(1, "r", 1) : write(1, "-", 1);
	(m & S_IWGRP) ? write(1, "w", 1) : write(1, "-", 1);
	if (m & S_ISGID)
		(m & S_IXGRP) ? write(1, "s", 1) : write(1, "S", 1);
	else
		(m & S_IXGRP) ? write(1, "x", 1) : write(1, "-", 1);
	(m & S_IROTH) ? write(1, "r", 1) : write(1, "-", 1);
	(m & S_IWOTH) ? write(1, "w", 1) : write(1, "-", 1);
	if (m & S_ISVTX)
		(m & S_IXGRP) ? write(1, "t", 1) : write(1, "T", 1);
	else
		(m & S_IXGRP) ? write(1, "x", 1) : write(1, "-", 1);
	if (errno != 0)
		ls_die(NULL);
}
